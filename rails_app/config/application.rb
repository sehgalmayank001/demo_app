require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    # config.middleware.insert_before ActionDispatch::ShowExceptions, "CatchJsonParseErrors"
    # config.middleware.use 'CatchJsonParseErrors'
    require "./app/middleware/catch_json_parse_errors.rb"
    config.middleware.insert_before Rack::Head, CatchJsonParseErrors
    config.autoload_paths << Rails.root.join('lib')
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
