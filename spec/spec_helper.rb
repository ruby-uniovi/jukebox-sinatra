require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

require 'sinatra'
set :environment, :test

require 'capybara'
require 'capybara/dsl'

require_relative '../lib/app'

Capybara.app = Jukebox::App

RSpec.configure do |config|

  config.include Capybara::DSL

  config.before do
    Mongoid.purge!
  end

end
