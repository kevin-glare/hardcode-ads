require_relative 'config/environment'

use Rack::RequestId, default: SecureRandom.hex(32)
use Rack::Ougai::LogRequests, Application.logger

run AdRoutes
