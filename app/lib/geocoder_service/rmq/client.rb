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
        @queue.publish(
          payload,
          opts.merge(
            persistent: true,
            app_id: 'ads'
          )
        )
      end
    end
  end
end
