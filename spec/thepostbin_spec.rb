require_relative '../app'
require 'rspec'
require 'rack/test'

set :environment, :test

describe ThePostBin do
  include Rack::Test::Methods

  def app
    ThePostBin
  end

  it "gives an ok status" do
    get '/'
    last_response.should be_ok
  end
end