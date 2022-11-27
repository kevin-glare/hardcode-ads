module AuthService
  module Rmq
    module Api
      def auth(token)
        payload = { token: }.to_json
        publish(payload, type: 'auth')
      end
    end
  end
end
