require 'spec_helper'

describe "GET /queue/songs" do

  it "returns an empty list if there are no queued songs" do
    visit "/queue/songs"
    parsed_body = JSON.parse(page.body)

    expect(parsed_body).to eq([])
  end

  it "returns a list containing the queued songs" do
    song = Song.create({:artist => "Gentleman feat Alborosie", :title => "Celebration", :url => "http://freshmusic.com/"})
    SongQueue.instance.songs.push(song)

    visit "/queue/songs"
    parsed_body = JSON.parse(page.body)
    parsed_song = parsed_body.first

    expect(parsed_body.size).to eq(1)
    expect(parsed_song["artist"]).to eq("Gentleman feat Alborosie")
    expect(parsed_song["title"]).to eq("Celebration")
    expect(parsed_song["url"]).to eq("http://freshmusic.com/")
  end

end
