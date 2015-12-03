require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe ".validates" do
    it "must have a name" do
      movie = Movie.new(name: nil)
      expect(movie).to_not be_valid
      expect(movie.errors.keys).to include :name
    end
  end
end
