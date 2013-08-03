# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Load APP configuration
ENV = YAML.load_file("#{Rails.root}/config/app.yml")[Rails.env]

# Initialize the Rails application.
FootballManager::Application.initialize!
