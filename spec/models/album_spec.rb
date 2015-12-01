require 'rails_helper'

RSpec.describe Album, type: :model do
  describe ".validates" do
    it "must have a name" do
      expect(Album.new(name: nil)).to_not be_valid
    end
  end

  #   it "can't have 141 characters" do
  #     expect(Post.new(bod: "a" * 141)).to be_invalid
  #   end
  #
  #   it "can have 140 characters" do
  #     expect(Post.new(bod: "a" * 140)).to be_valid
  #   end
  # end
  #
  # it "count it's characters" do
  #   expect(Post.new(bod: "b" * 122).characters_count).to eq 122
  # end

end
