require 'rails_helper'

RSpec.describe Movie, type: :model do

  describe ".validates" do
    let (:movie_data) do {title:"Alien", director: "Ridley Scott", description: "Here kitty, kitty, kitty"} end
    it "must have a title" do
      expect(Movie.new(movie_data.merge(title: nil))).to_not be_valid
    end
    it "must have a author" do
      expect(Movie.new(movie_data.merge(director: nil))).to_not be_valid
    end
    it "must have a description" do
      expect(Movie.new(movie_data.merge(description: nil))).to_not be_valid
    end
  end
  
end
