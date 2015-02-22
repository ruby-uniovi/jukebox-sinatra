class SongQueue
  attr_reader :songs

  def initialize(songs)
    @songs = songs || []
  end

  def add_song(song)
    @songs << song
  end
end
