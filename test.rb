ENV['RACK_ENV'] = 'test'
require 'minitest/autorun'
require_relative 'mizutamari-api.rb'
require 'rack/test'
 
include Rack::Test::Methods

def app
  Mizu
end

describe "page get" do
	it "should return the package data as json" do
		get '/EG297596005JP'
		assert_equal "application/json", last_response["Content-Type"]
	end
end
