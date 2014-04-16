ENV['RACK_ENV'] = 'test'
require 'minitest/autorun'
require_relative 'mizutamari-api.rb'
 
def app
  Sinatra::Application
end

describe "page get" do
	it "should return the package data as json" do
		get 'EG297596005JP'
		resp = last_response.body
		resp.status.must_equal 200
		resp.data != nil
	end
end