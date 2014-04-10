ENV['RACK_ENV'] = 'test'
require 'minitest/autorun'
require_relative 'mizutamari-api.rb'
 
include Rack::Test::Methods
 
def app
  Sinatra::Application
end