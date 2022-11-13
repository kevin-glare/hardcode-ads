# frozen_string_literal: true

class Configurable
  extend Dry::Configurable

  setting :i18n do
    setting :default_locale, default: :ru
    setting :available_locales, default: %i[en ru]
  end

  setting :db do
    setting :adapter, default: ENV.fetch('DB_ADAPTER', 'postgresql')
    setting :pool, default: ENV.fetch('DB_POOL', 5)
    setting :host, default: ENV.fetch('DB_HOST', 'localhost')
    setting :port, default: ENV.fetch('DB_PORT', 5432)
    setting :user, default: ENV.fetch('DB_USER', nil)
    setting :password, default: ENV.fetch('DB_PASSWORD', nil)
    setting :database, default: ENV.fetch('DB_DATABASE')
  end

  setting :pagination do
    setting :page_size, default: 30
  end

  setting :geocoder_url, default: ENV.fetch('GEOCODER_URL')
end

AppSetting = Configurable.config.freeze
