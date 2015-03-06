require 'spec_helper'

describe "GET /songs/new" do

  before :each do
    visit "/songs/new"
  end

  it "has a post form pointing to the creation action" do
    expect(page).to have_selector("form[method='POST'][action='/song']")
  end

  context "it has a form" do
    it "with an input for the artist" do
      expect(page).to have_selector("form input[name=artist]")
    end

    it "with an input for the title" do
      expect(page).to have_selector("form input[name=title]")
    end

    it "with an input for the URL" do
      expect(page).to have_selector("form input[name=url]")
    end
  end

  it "has a button to submit the form" do
    expect(page).to have_selector("form button[type=submit]")
  end


end
