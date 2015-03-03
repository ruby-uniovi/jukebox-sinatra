require_relative 'config'

module Jukebox
  class App < Sinatra::Application

    configure do
      Song.create_sample_songs
    end

    get "/" do
      @window_title = "Jukebox"
      @marketing_quote = ["It's like being in 1934!", "Better than Grooveshark", "Spotify's next logical acquisition"].sample
      @author = ["No one ever", "Author's mother", "Clueless tech journalist"].sample

      erb :"jukebox/hello"
    end

    get "/queue" do
      @page_title = "Jukebox"
      @queue = SongQueue.instance

      erb :"queue/show"
    end

    post "/queue/add" do
      song = Song.find(params[:song_id])
      SongQueue.instance.songs.push(song)

      confirmation_msg = "'#{song.display_name}' has been successfully added to the Jukebox"

      status 200
      body confirmation_msg
    end

    post "/queue/remove" do
      song = Song.find(params[:song_id])
      SongQueue.instance.songs.delete(song)

      status 200
      body ''
    end

    get "/queue/songs" do
      songs = SongQueue.instance.songs

      status 200
      body songs.to_json
    end

    get "/song/:id" do
      @song = Song.find(params[:id])
      @page_title = @song.display_name

      erb :"songs/play"
    end

    get "/songs" do
      @page_title = "Song library"
      @songs = Song.all

      erb :"songs/index"
    end

    get "/songs/new" do
      @page_title = "New song"
      @song = Song.new

      erb :"songs/new"
    end

    post "/song" do
      Song.create(params)

      redirect "/songs"
    end

  end
end
