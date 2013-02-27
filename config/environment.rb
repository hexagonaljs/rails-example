# Load the rails application
require File.expand_path('../application', __FILE__)

require "tilt"
Tilt::CoffeeScriptTemplate.default_bare = true

# Initialize the rails application
RailsExample::Application.initialize!
