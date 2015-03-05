class SongQueue

  include Mongoid::Document

  field :name, :type => String

  has_many :songs

  def self.instance
    @queue ||= SongQueue.create
  end

  def self.reset_instance!
    @queue = nil
  end

end
