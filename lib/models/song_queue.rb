class SongQueue

  include Mongoid::Document

  field :name, :type => String

  has_many :songs

  def self.instance
    @queue ||= SongQueue.create
  end

  def audio_sources
    songs.map(&:url)
  end

end
