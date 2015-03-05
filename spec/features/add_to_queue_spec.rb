require 'spec_helper'

describe "POST /queue/add" do

  let(:song) { Song.create(:artist => "Dizzie Gillespie", :title => "Salt Peanuts", :url => "http://example.com/nothing_here") }

  it "adds a song that is already in the library to the default queue" do
    page.driver.post("/queue/add", :song_id => song.id)
    expect(SongQueue.instance.songs.map(&:display_name)).to eql([song.display_name])
  end

  it "returns a text with the song and artist" do
    page.driver.post("/queue/add", :song_id => song.id)
    expect(page).to have_content(song.display_name)
  end

end
