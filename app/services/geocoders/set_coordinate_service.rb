# frozen_stirng_literal: true

require "uri"
require "json"
require "net/http"

module Geocoders
  class SetCoordinateSerivice
    prepend BasicService

    option :ad

    attr_reader :ad, :coordinates

    def call
      response = send_request(@ad.city)
      if response['coordinates']
        @ad.lat = response['coordinates'][0]
        @ad.lon = response['coordinates'][1]
        @ad.valid? ? @ad.save : fail!(@ad.errors)
      else
        fail!(response["errors"])
      end
    end

    private

    def send_request(city)
      url = URI(AppSetting.geocoder_url)
      http = Net::HTTP.new(url.host, url.port)
      request = Net::HTTP::Post.new(url)
      request["Content-Type"] = "application/json"
      request.body = JSON.dump({ "city": city })
      response = http.request(request)
      JSON.parse(response.read_body)
    end
  end
end
