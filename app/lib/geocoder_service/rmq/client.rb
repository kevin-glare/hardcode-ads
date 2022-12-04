# frozen_string_literal: true

require_relative 'api'

module GeocoderService
  module Rmq
    class Client
      include Api
      extend Dry::Initializer[undefined: false]

      option :queue, default: proc { create_queue }

      def create_queue
        channel = RabbitMq.channel
        channel.queue('geocoding', durable: true)
      end

      def publish(payload, opts = {})
        Thread.current[:request_id] ||= SecureRandom.hex(16)

        @queue.publish(
          payload,
          opts.merge(
            persistent: true,
            app_id: AppSetting.app.name,
            headers: {
              request_id: Thread.current[:request_id]
            }
          )
        )
      end
    end
  end
end
