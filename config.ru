# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
run Rails.application

# Allow font files to be loaded from anywhere (for loading webfonts in Firefox) 
