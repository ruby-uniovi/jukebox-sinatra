require 'spec_helper'

describe Song do

  it "resets the test database each time it runs" do
    Song.create(:artist => "Velvet Underground", :title => "Venus in Furs")
    Song.create(:artist => "David Bowie", :title => "Rebel, Rebel")
    expect(Song.count).to eql(2)
  end

end
