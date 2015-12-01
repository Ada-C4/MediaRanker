require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe ".validates" do
    it "must have a title" do
      expect(Movie.new(title: nil)).to be_invalid
    end

    it "must have a unique title" do
      Movie.create(title: "a")
      expect(Movie.new(title: "a")).to be_invalid
    end
  end
end
