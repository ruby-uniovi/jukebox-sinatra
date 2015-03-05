require 'spec_helper'

describe "GET /songs" do

  before :each do
    Song.create(:artist => "Art Blakey & The Jazz Messengers", :title => "A Night in Tunisia", :url => "http://example.com/nothing_here")
    Song.create(:artist => "Dizzie Gillespie", :title => "Salt Peanuts", :url => "http://example.com/nothing_here")

    visit "/songs"
  end

  it "shows a list of songs" do
    expect(page).to have_content("A Night in Tunisia")
    expect(page).to have_content("Salt Peanuts")
  end

  it "shows a link to create a new song" do
    expect(page).to have_selector("a.new-song[href='/songs/new']")
  end

  it "shows a link to the jukebox" do
    expect(page).to have_selector("a.to-jukebox[href='/queue']")
  end

end
