require 'spec_helper'

describe SongQueue do 

  context "POST /queue/add" do
    it "adds a song that is already in the library to the default queue" do
      s = Song.create(:artist => "Dizzie Gillespie", :title => "Salt Peanuts", :url => "http://example.com/nothing_here")
      page.driver.post("/queue/add", :song_id => s.id)
      expect(SongQueue.instance.songs.map(&:display_name)).to eql([s.display_name])
    end

    it "returns a text with the song and artist" do
      s = Song.create(:artist => "Dizzie Gillespie", :title => "Salt Peanuts", :url => "http://example.com/nothing_here")
      page.driver.post("/queue/add", :song_id => s.id)
      expect(page).to have_content(s.display_name)
    end
  end
  
end
