module GeocoderService
  module Http
    module Api
      def geocode(ad)
        response = connection.post("/api/v1/geocoder") do |request|
          request.body = { id: ad.id, city: ad.city }.to_json
        end

        JSON(response.body).dig('coordinates')
      end
    end
  end
end
