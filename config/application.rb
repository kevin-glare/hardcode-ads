# frozen_string_literal: true

class Application < Sinatra::Base
  configure do
    register Sinatra::Namespace

    set :app_file, File.expand_path('..', __dir__)
  end

  configure :development do
    register Sinatra::Reloader
    set :show_exceptions, false
  end
end
