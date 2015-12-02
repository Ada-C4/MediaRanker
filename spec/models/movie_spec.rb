require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe ".validates" do
    it "must have a name" do
      expect(Movie.new(name: nil)).to_not be_valid
    end
    # 
    # it "must have a director" do
    #   expect(Movie.new(director: nil)).to be_invalid
    # end
    #
    # it "must have a description" do
    #   expect(Movie.new(description: nil)).to be_invalid
    # end
    #
    # it "must have a rank" do
    #   expect(Movie.new(rank: nil)).to_not be_valid
    # end
  end
end
