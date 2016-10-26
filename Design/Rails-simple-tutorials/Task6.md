# Rails app in a Subdirectory

Change 'config.ru' to -

~~~~~~
# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

require ::File.expand_path('../config/environment',  __FILE__)
map '/Members' do
  run Rails.application
end
~~~~~~


Add the following lines to config/environments/* -

~~~~~~
  config.relative_url_root = "/Members"
  config.action_controller.relative_url_root = "/Members"
~~~~~~

