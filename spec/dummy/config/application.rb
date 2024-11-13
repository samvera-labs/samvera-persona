require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)
require "samvera-persona"
require 'sprockets/railtie'

module Dummy
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.active_support.cache_format_version = 7.0
    config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end

