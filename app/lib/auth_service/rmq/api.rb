# frozen_string_literal: true

module AuthService
  module Rmq
    module Api
      def auth(jwt)
        payload = { jwt: jwt }.to_json
        publish(payload, type: 'auth')
      end
    end
  end
end
