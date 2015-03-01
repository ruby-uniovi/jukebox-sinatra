require 'sinatra'
require 'mongoid'

if development?
  require 'better_errors'
  require 'sinatra/reloader'
end

set :root, File.dirname(__FILE__)

configure do
  set :bind, "0.0.0.0"
  Mongoid.load!("config/mongoid.yml", settings.environment)
  Dir["lib/models/**/*.rb"].each { |model_path| require "./#{model_path}" }
end

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = :root
end

require 'sinatra/assetpack'

register Sinatra::AssetPack

assets do
    serve '/js', from: 'assets/javascripts'
    serve '/css', from: 'assets/css'
end
