require 'sinatra'
require_relative 'config'

get "/queue" do
  @queue = build_sample_queue
  erb :queue
end

def build_sample_queue
  one_song = Song.new("19 días y 500 noches", "Joaquín Sabina")
  other_song = Song.new("Semilla en la tierra", "Carlos Chaouen")  
  
  SongQueue.new([one_song, other_song])
end
