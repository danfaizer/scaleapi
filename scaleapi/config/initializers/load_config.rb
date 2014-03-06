require 'yaml'

APP_CONFIG = YAML.load_file("#{Rails.application.root}/config/config.yml")[Rails.env]
