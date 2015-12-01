require 'rails_helper'

RSpec.describe Album, type: :model do
  describe ".validates" do
    it "must have a title" do
      expect(Album.new(title: nil)).to_not be_valid
    end

    it "must have a ranking of zero on creation" do
      expect(Album.new(ranking: 1)).to_not be_valid
      expect(Album.new(ranking: 0)).to be_valid
    end
  end
end
