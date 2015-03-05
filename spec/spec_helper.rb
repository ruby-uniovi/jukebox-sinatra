require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start if ENV["CODECLIMATE_REPO_TOKEN"]

require 'sinatra'
set :environment, :test

require 'capybara'
require 'capybara/dsl'

require_relative '../lib/app'

Capybara.app = Sinatra::Application

RSpec.configure do |config|

  config.include Capybara::DSL

  config.before do
    Mongoid.purge!
    SongQueue.reset_instance!
  end

end
