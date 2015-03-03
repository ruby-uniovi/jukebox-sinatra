require 'spec_helper'

describe "/" do 
  it "includes a marketing quote" do
    visit "/"
    expect(page).to have_selector("blockquote")
  end

  it "has a button into the song library" do
    visit "/"
    expect(page).to have_selector("a[href='/songs']")
  end
end
