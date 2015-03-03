require 'spec_helper'

describe Song do
  context "/songs" do

    it "shows a list of songs" do
      Song.create(:artist => "Art Blakey & The Jazz Messengers", :title => "A Night in Tunisia", :url => "http://example.com/nothing_here")
      Song.create(:artist => "Dizzie Gillespie", :title => "Salt Peanuts", :url => "http://example.com/nothing_here")

      visit "/songs"

      expect(page).to have_content("A Night in Tunisia")
      expect(page).to have_content("Salt Peanuts")
    end

    it "shows a link to create a new song" do
      visit "/songs"

      expect(page).to have_selector("a.new-song[href='/songs/new']")
    end

    it "shows a link to the jukebox" do
      visit "/songs"

      expect(page).to have_selector("a.to-jukebox[href='/queue']")
    end

  end

  context "/songs/new" do

    it "has a form with inputs for artist, title and url" do
      visit "/songs/new"

      expect(page).to have_selector("form input[name=artist]")
      expect(page).to have_selector("form input[name=title]")
      expect(page).to have_selector("form input[name=url]")
    end

    it "has a button to submit the form" do
      visit "/songs/new"

      expect(page).to have_selector("form button[type=submit]")
    end

    it "creates a new song when submitting the form" do
      visit "/songs/new"
      within "form" do
        fill_in "artist", :with => "Dizzie Gillespie"
        fill_in "title", :with => "Salt Peanuts"
        fill_in "url", :with => "http://nononoexisto.com"
        click_button("Let's Swing!")
      end

      expect(Song.first.display_name).to eql "Dizzie Gillespie - Salt Peanuts"
    end
  end
end
