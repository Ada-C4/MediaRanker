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

    it "cannot have a title with 151 characters" do
      expect(Album.new(title: "a" * 151)).to be_invalid
    end

    it "can have a title with 150 characters" do
      expect(Album.new(title: "a" * 150)).to be_valid
    end

  end
end
