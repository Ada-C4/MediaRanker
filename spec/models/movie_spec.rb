require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe ".validates" do

    it "must have a name" do
      expect(Movie.new(name: nil)).to_not be_valid
    end
    
  end

end
