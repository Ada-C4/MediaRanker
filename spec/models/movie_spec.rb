require 'rails_helper'

RSpec.describe Movie, type: :model do
  it_behaves_like "a medium"

  describe ".validates" do
    it "cannot have a director with more than 100 characters" do
      expect(Movie.new(title: "a", director: "a" * 100)).to be_valid
      expect(Movie.new(title: "a", director: "a" * 101)).to be_invalid
    end
  end
end
