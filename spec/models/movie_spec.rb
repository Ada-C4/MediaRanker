require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe ".validates" do
    it "must have a title" do
      expect(Movie.new(name: nil)).to be_invalid
    end

    it "must have a number of votes" do
      expect(Movie.new(name: "Movie")).to be_invalid
      expect(Movie.new(name: "Test Movie", votes: 0)).to be_valid
    end
  end
end
