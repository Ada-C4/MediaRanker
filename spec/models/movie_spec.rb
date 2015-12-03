require 'rails_helper'

RSpec.describe Movie, type: :model do
  it_behaves_like "a medium"

  describe ".validates" do
    # it "must have a title" do
    #   expect(Movie.new(title: nil)).to be_invalid
    # end

    it "must have a unique title" do
      Movie.create(title: "a")
      expect(Movie.new(title: "a")).to be_invalid
    end

    it "cannot have a title with more than 100 characters" do
      expect(Movie.new(title: "a" * 100)).to be_valid
      expect(Movie.new(title: "a" * 101)).to be_invalid
    end

    it "cannot have a director with more than 100 characters" do
      expect(Movie.new(title: "a", director: "a" * 100)).to be_valid
      expect(Movie.new(title: "a", director: "a" * 101)).to be_invalid
    end

    it "cannot have a description with more than 1000 characters" do
      expect(Movie.new(title: "a", description: "a" * 1000)).to be_valid
      expect(Movie.new(title: "a", description: "a" * 1001)).to be_invalid
    end
  end
end
