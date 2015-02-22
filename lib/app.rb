require 'sinatra'
require_relative 'config'

configure do
  Song.create_sample_songs
end

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
  SongQueue.new(Song.all)
end
