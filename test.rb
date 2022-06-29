require 'minitest/mock'
require 'minitest/autorun'
require './accidental/rack/env_injector'

describe Accidental::Rack::EnvInjector do
  specify "the values are added to the env" do
    downstream = [200, {"Content-Type": "text/plain"}, ["whatup"]]
    marker = Object.new
    key = "system.marker"

    # mock downstream rack app
    app = Minitest::Mock.new 
    app.expect(:call, downstream) do |env|
      marker.equal? env[key]
    end

    # call the middleware
    subject = Accidental::Rack::EnvInjector.new(app, key => marker)
    result  = subject.call({})

    assert app.verify # it called the downstream app with the correct env
    assert_equal result, downstream # it didn't touch the response
  end
end

