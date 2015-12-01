require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe ".validates" do
    it "has a name" do
      expect(Movie.new(name: nil)).to_not be_valid
    end

    it "has a unique name" do
      Movie.create(name: "a")
      expect(Movie.new(name: "a")).to_not be_valid
    end

    it "can't have a 301 char description" do
      expect(Movie.new(description: "a" * 301)).to_not be_valid
    end
  end
end
