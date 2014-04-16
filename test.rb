ENV['RACK_ENV'] = 'test'
require 'minitest/autorun'
require_relative 'mizutamari-api.rb'
require 'rack/test'
 
include Rack::Test::Methods

def app
  Sinatra::Application
end

describe "page get" do
	it "should return the package data as json" do
		get 'EG297596005JP'
		assert_equal last_response["Content-Type"], "application/json"
	end
end
