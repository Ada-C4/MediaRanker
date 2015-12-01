require 'rails_helper'

RSpec.describe Album, type: :model do
  describe ".validates" do
    it "must have a title" do
      expect(Album.new(title: nil)).to be_invalid
    end

    it "must have a unique title" do
      Album.create(title: "a")
      expect(Album.new(title: "a")).to be_invalid
    end

    it "cannot have a title with more than 100 characters" do
      expect(Album.new(title: "a" * 100)).to be_valid
      expect(Album.new(title: "a" * 101)).to be_invalid
    end

    it "cannot have an artist with more than 100 characters" do
      expect(Album.new(title: "a", artist: "a" * 100)).to be_valid
      expect(Album.new(title: "a", artist: "a" * 101)).to be_invalid
    end

    it "cannot have a description with more than 1000 characters" do
      expect(Album.new(title: "a", description: "a" * 1000)).to be_valid
      expect(Album.new(title: "a", description: "a" * 1001)).to be_invalid
    end
  end
end
