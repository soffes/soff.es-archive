require ::File.expand_path('../config/environment',  __FILE__)
require 'rack-obama'
use Rack::Obama
run SamSoffes::Application
