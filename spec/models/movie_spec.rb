require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe ".validates" do
    it "must have a title" do
      expect(Movie.new(name: nil)).to be_invalid
    end
  end
end
