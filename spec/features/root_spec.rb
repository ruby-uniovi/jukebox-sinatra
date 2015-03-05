require 'spec_helper'

describe "GET /" do

  before :each do
    visit "/"
  end

  it "includes a marketing quote" do
    expect(page).to have_selector("blockquote")
  end

  it "shows a link/button to the song library" do
    expect(page).to have_selector("a[href='/songs']")
  end
end
