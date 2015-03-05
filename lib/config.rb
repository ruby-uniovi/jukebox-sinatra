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

    js :jukebox, ['/js/queue_show.js', 'js/queue_dom_manipulator.js', '/js/jukebox_client.js']
    js :song_library, ['/js/songs_index.js', '/js/jukebox_client.js']
    css :jukebox, ['/css/queue.css']
end

