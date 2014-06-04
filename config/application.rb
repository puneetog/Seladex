require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Seladex
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'
    config.assets.paths << "#{Rails.root}/app/assets/fonts"
    config.assets.paths << "#{Rails.root}/vendor/assets/ico"
    # config.assets.paths << "#{Rails.root}/vendor/assets/javascripts/backstretch"
    # config.assets.paths << "#{Rails.root}/vendor/assets/javascripts/bootstrap"
    # config.assets.paths << "#{Rails.root}/vendor/assets/javascripts/legend"
    # config.assets.paths << "#{Rails.root}/vendor/assets/stylesheets/3dbuttons"
    # config.assets.paths << "#{Rails.root}/vendor/assets/stylesheets/bootstrap"
    # config.assets.paths << "#{Rails.root}/vendor/assets/stylesheets/font"
    # config.assets.paths << "#{Rails.root}/vendor/assets/stylesheets/left_menu"

    # config.assets.precompile += ['styles.css', 'leftmenu.css', 'font-awesome.min.css', 'bootstrap.min.css', '3dbutton.css','jquery.backstretch.js', 'bootstrap.min.js', 'bootstrap-acknowledgeinput.min.js', 'happy.js', 'happy.methods.js', 'leftmenu.js', 'script.js', 'theme.js']
    # config.assets.precompile += ['bootstrap/*', 'backstretch/*', 'legend/*', '3dbuttons/*', 'font/*', 'left_menu/*']
    
    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de


    config.active_record.schema_format = :sql

      config.to_prepare do
        Devise::SessionsController.layout "devise"
        Devise::RegistrationsController.layout proc{ |controller| user_signed_in? ? "application" : "devise" }
        Devise::ConfirmationsController.layout "devise"
        Devise::UnlocksController.layout "devise"            
        Devise::PasswordsController.layout "devise"        
      end

  end
end
