require 'spec_helper'

describe Song do

  context "test running" do
    it "resets the test database each time it runs" do
      Song.create(:artist => "Velvet Underground", :title => "Venus in Furs")
      Song.create(:artist => "David Bowie", :title => "Rebel, Rebel")
      expect(Song.count).to eql(2)
    end
  end

  context "creation" do

    let(:song) {Song.create(:artist => "Art Blakey & The Jazz Messengers", :title => "A Night in Tunisia", :url => "http://example.com/nothing_here")}

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



end
