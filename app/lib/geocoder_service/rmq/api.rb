# frozen_string_literal: true

module GeocoderService
  module Rmq
    module Api
      def geocode_later(ad)
        payload = { id: ad.id, city: ad.city }.to_json
        publish(payload, type: 'geocode')
      end
    end
  end
end
