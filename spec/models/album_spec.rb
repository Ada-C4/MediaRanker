require 'rails_helper'

RSpec.describe Album, type: :model do
  describe ".validates" do
    it "must have a title and an artist" do
      expect(Album.new(title: "a", creator: nil)).to_not be_valid
      expect(Album.new(title: nil, creator: "a")).to_not be_valid
      expect(Album.new(title: "a", creator: "a")).to be_valid
    end
  end
end
