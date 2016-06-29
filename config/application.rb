require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Rails4CrudWithAngularjs
  class Application < Rails::Application
    config.time_zone = 'Berlin'

    config.i18n.enforce_available_locales = true

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    config.i18n.load_path += Dir[Rails.root + 'config' + 'locales' + 'models' + '*.{rb,yml}']
    config.i18n.default_locale = :de

  end
end
