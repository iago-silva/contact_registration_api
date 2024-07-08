# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true

    config.encoding = 'utf-8'
    config.time_zone = 'America/Recife'
    config.active_record.default_timezone = :local
    config.i18n.available_locales = ['pt-BR', 'en']
    config.i18n.enforce_available_locales = true
    config.i18n.default_locale = 'pt-BR'
    config.i18n.load_path +=
      Dir[Rails.root.join('config/locales/**/*.yml').to_s]
  end
end
