require 'rails_helper'

RSpec.describe Album, type: :model do
  describe ".validates" do
    it "must have a title" do
      expect(Album.new(name: nil)).to be_invalid
    end

    it "must have a number of votes" do
      expect(Album.new(name: "Album")).to be_invalid
      expect(Album.new(name: "Test Album", votes: 0)).to be_valid
    end

  end
end
