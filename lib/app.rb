require 'sinatra'
require 'mongoid'

if development?
  require 'better_errors'
  require "sinatra/reloader" 
end

configure do
  set :bind, "0.0.0.0"
  Mongoid.load!("config/mongoid.yml")
  Dir["models/**/*.rb"].each {|model| require_relative model}
end

configure :development do
  use BetterErrors::Middleware  
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

get "/queue" do
  @queue = build_sample_queue
  erb :queue
end

def build_sample_queue
  one_song = Song.new("19 días y 500 noches", "Joaquín Sabina")
  other_song = Song.new("Semilla en la tierra", "Carlos Chaouen")  
  
  SongQueue.new([one_song, other_song])
end
