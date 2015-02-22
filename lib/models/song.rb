class Song
  include Mongoid::Document

  field :artist, :type => String
  field :title, :type => String
  field :url, :type => String

end

