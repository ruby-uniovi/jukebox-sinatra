require 'sinatra'

if development?
  require 'better_errors'
  require "sinatra/reloader" 
end

configure :development do
  use BetterErrors::Middleware  
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

get "/queue" do
  @queue = build_sample_queue
  erb :queue
end

class Queue
  attr_reader :songs

  def initialize(songs)
    @songs = songs || []
  end

  def add_song(song)
    @songs << song
  end
end

class Song
  attr_reader :name, :artist

  def initialize(name, artist)
    @name = name
    @artist = artist    
  end
end

def build_sample_queue
  one_song = Song.new("19 días y 500 noches", "Joaquín Sabina")
  other_song = Song.new("Semilla en la tierra", "Carlos Chaouen")  
  
  Queue.new([one_song, other_song])
end