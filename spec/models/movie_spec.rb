require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe ".validates" do
    it "must have a title and a director" do
      expect(Movie.new(title: "a", creator: nil)).to_not be_valid
      expect(Movie.new(title: nil, creator: "a")).to_not be_valid
      expect(Movie.new(title: "a", creator: "a")).to be_valid
    end
  end
end
