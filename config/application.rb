require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'log4r'
require 'log4r/yamlconfigurator'
require 'log4r/outputter/datefileoutputter'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsStudy
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :ja

    config.generators do |g|
      g.test_framework = :rspec
      g.view_specs = false
    end

    log4r_config = YAML.load_file(File.expand_path('../log4r.yml', __FILE__))
    Log4r::YamlConfigurator.decode_yaml(log4r_config['log4r_config'])
    config.logger = ActiveSupport::Logger.new(config.paths['log'].first, 'daily')
  end
end
