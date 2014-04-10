ENV['RACK_ENV'] = 'test'
require 'minitest/autorun'
require_relative 'mizutamari-api.rb'
 
def app
  Sinatra::Application
end