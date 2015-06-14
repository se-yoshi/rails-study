require 'log4r/yamlconfigurator'
require 'log4r/outputter/datefileoutputter'

module RailsStudy
  class Engine < ::Rails::Engine
    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
    end

    log4r_config = YAML.load_file(File.expand_path('../../../config/log4r.yml', __FILE__))
    Log4r::YamlConfigurator.decode_yaml(log4r_config['log4r_config'])
  end
end
