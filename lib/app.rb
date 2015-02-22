require 'sinatra'
require_relative 'config'

get "/queue" do
  @queue = build_sample_queue
  erb :queue
end

get "/song/:id" do
  @song = Song.find(params[:id])
  erb :"songs/play"
end

get "/songs" do
  @songs = Song.all
  erb :"songs/index"
end

get "/songs/new" do
  @song = Song.new
  erb :"songs/new"
end

post "/song" do
  Song.create(params)
  redirect "/songs"
end

def build_sample_queue
  one_song = Song.new("19 días y 500 noches", "Joaquín Sabina")
  other_song = Song.new("Semilla en la tierra", "Carlos Chaouen")  
  
  SongQueue.new([one_song, other_song])
end
