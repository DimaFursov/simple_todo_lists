require File.expand_path('../boot', __FILE__)
#require_relative 'boot'
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)


module SimpleTodoLists
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.action_view.embed_authenticity_token_in_remote_forms = true    

    #config.active_record.raise_in_transactional_callbacks = true

    #You can allow single IP's or whole networks. Say you want to share your console with 192.168.0.100:
    # config.web_console.permissions = '192.168.0.100'
    # config.web_console.whitelisted_ips = '80.107.134.220'
    # When you are ready, you can opt into the new behavior and remove the deprecation warning by adding the following configuration to your config/application.rb:
    # ActiveSupport.halt_callback_chains_on_return_false = false
  end
end
