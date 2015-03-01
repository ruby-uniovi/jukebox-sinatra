require 'spec_helper'

describe Song do

  let(:song) {Song.create(:artist => "Art Blakey & The Jazz Messengers", :title => "A Night in Tunisia", :url => "http://example.com/nothing_here")}

  context "test running" do
    it "resets the test database each time it runs" do
      Song.create(:artist => "Velvet Underground", :title => "Venus in Furs")
      Song.create(:artist => "David Bowie", :title => "Rebel, Rebel")
      expect(Song.count).to eql(2)
    end
  end

  context "creation" do
    it "has a title" do
      expect(song.title).to eql("A Night in Tunisia")
    end

    it "has an artist" do
      expect(song.artist).to eql("Art Blakey & The Jazz Messengers")
    end

    it "has a URL" do
      expect(song.url).to eql("http://example.com/nothing_here")
    end
  end

  describe ".create_sample_songs" do
    it "creates some songs if there are none" do
      Song.create_sample_songs
      expect(Song.all).to_not be_empty
    end

    it "doesn't create songs if there are some already" do
      Song.create(:artist => "A", :title => "T", :url => "URL")
      expect {Song.create_sample_songs}.to_not change {Song.count}
    end
  end

  describe "#display_name" do
    it "returns the artist and the title concatenated" do
      expect(song.display_name).to eql "Art Blakey & The Jazz Messengers - A Night in Tunisia"
    end
  end

end
