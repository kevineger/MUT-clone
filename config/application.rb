require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Mut
  class Application < Rails::Application
    Rails.application.config.assets.precompile += %w( forem.css )
    Rails.application.config.assets.precompile += %w( forem.js )
    Rails.application.config.assets.precompile += ['active_admin.css']
    Rails.application.config.action_view.field_error_proc = Proc.new { |html_tag, instance|
      html_tag
    }
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    unless Rails.env.production?
      ENV['RECAPTCHA_PUBLIC_KEY'] = '6LfUIfcSAAAAAIv1gPjUDrRw5mwTFJw4wZ5Ju8zQ'
      ENV['RECAPTCHA_PRIVATE_KEY'] = '6LfUIfcSAAAAALv_mHll-5FeVUCbzYRxVt_HIrvF'
    end
  end
end
