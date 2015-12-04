require 'rails_helper'

RSpec.describe Album, type: :model do
  it_behaves_like "a medium"

  describe ".validates" do
    it "cannot have an artist with more than 100 characters" do
      expect(Album.new(title: "a", artist: "a" * 100)).to be_valid
      expect(Album.new(title: "a", artist: "a" * 101)).to be_invalid
    end
  end
end
