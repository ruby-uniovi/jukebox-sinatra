class Song

  include Mongoid::Document

  field :artist, :type => String
  field :title, :type => String
  field :url, :type => String

  belongs_to :queue, class_name: "SongQueue", inverse_of: :songs

  def self.create_sample_songs
    return unless Song.empty?
    songs_attrs = [
      {
        :artist => "Benny Goodman",
        :title => "So Many Memories",
        :url => "https://archive.org/download/BennyGoodman141-150of275/BennyGoodman-SoManyMemories1937.mp3"
      },
      {
        :artist => "Duke Ellington",
        :title => "Saddest Tale",
        :url => "https://archive.org/download/DukeEllington-01-10/DukeEllington-SaddestTale1934.mp3"
      },
      {
        :artist => "Count Basie",
        :title => "Take the A Train",
        :url => "https://archive.org/download/CountBasie-11-20/CountBasieDukesOrch-TakeTheATrain.mp3"
      }
    ]
    songs_attrs.each do |attrs|
      Song.create(attrs)
    end
  end

  def display_name
    "#{artist} - #{title}"
  end

end
