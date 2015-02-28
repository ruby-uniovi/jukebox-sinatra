require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require 'sinatra'
set :environment, :test
require_relative '../lib/config'


RSpec.configure do |config|

  config.before do
    Mongoid.purge!
  end

end
