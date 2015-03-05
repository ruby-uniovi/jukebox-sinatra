require 'spec_helper'

describe "POST /song" do
  it "creates a new song when submitting the form" do
    visit "/songs/new"

    within "form" do
      fill_in "artist", :with => "Dizzie Gillespie"
      fill_in "title", :with => "Salt Peanuts"
      fill_in "url", :with => "http://nononoexisto.com"
      click_button("Let's Swing!")
    end

    expect(Song.count).to eql 1
    expect(Song.first.display_name).to eql "Dizzie Gillespie - Salt Peanuts"
  end

end
