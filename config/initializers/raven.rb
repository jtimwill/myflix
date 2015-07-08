if Rails.env.staging? || Rails.env.production?
require 'raven'

  Raven.configure do |config|
    config.dsn = 'SENTRY_DSN'
  end
end

