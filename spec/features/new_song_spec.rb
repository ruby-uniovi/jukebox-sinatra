require 'spec_helper'

describe "GET /songs/new" do

  before :each do
    visit "/songs/new"
  end

  it "has a post form pointing to the creation action" do
    expect(page).to have_selector("form[method='POST'][action='/song']")
  end

  it "has a form with inputs for artist, title and url" do
    expect(page).to have_selector("form input[name=artist]")
    expect(page).to have_selector("form input[name=title]")
    expect(page).to have_selector("form input[name=url]")
  end

  it "has a button to submit the form" do
    expect(page).to have_selector("form button[type=submit]")
  end
end
