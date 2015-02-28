require 'spec_helper'

describe SongQueue do

  let(:queue) { SongQueue.new }

  let(:song) { Song.create({:artist => "Benny Goodman", :title => "So Many Memories"}) }

  context "songs container" do
    it "adds songs" do
      queue.songs.push(song)

      expect(queue.songs.size).to eql 1
    end

    it "doesn't allow duplicated songs" do
      queue.songs.push(song)
      queue.songs.push(song)

      expect(queue.songs.size).to eql 1
    end

    it "deletes songs" do
      queue.songs.push(song)
      queue.songs.delete(song)

      expect(queue.songs.size).to eql 0
    end
  end

  describe "#instance" do
    it "returns the same object between calls" do
      other_song = Song.create({:artist => "Fakeman", :title => "Keep it real"})

      SongQueue.instance.songs.push(song)
      SongQueue.instance.songs.push(other_song)

      expect(SongQueue.instance.songs.size).to eql 2
    end
  end


end
