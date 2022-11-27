require 'dry-initializer'
require_relative 'api'

module GeocoderService
  module Http
    class Client
      extend Dry::Initializer[undefined: false]
      include Api

      option :url, default: proc { 'http://localhost:3002' }
      option :connection, default: proc { build_connection }

      private

      def build_connection
        Faraday.new(
          url: @url,
          headers: {'Content-Type' => 'application/json'}
        )
      end
    end
  end
end
