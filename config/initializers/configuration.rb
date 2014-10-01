require 'yaml'

ConfigurationFile = Rails.root.join 'config', 'elasticsearch.yml'
AppConfig = OpenStruct.new(YAML::load_file(ConfigurationFile))[Rails.env]