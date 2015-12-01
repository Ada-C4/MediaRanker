require 'rails_helper'

RSpec.describe Album, type: :model do
  describe ".validates" do
    it "must have a title" do
      expect(Album.new(title: nil)).to_not be_valid
    end

    it "must have a ranking of zero on creation" do
      expect(Album.new(title: "t", ranking: 1)).to_not be_valid
      expect(Album.new(title: "t", ranking: 0)).to be_valid
    end
  end

  # describe "top_ten" do
  #   it "there are albums here" do
  #     expect(Album.all.length).to_not eq(0)
  #   end
  #
  #   it "returns just ten records" do
  #     expect(Album.top_ten.length).to eq(10)
  #   end
  #
  #   it "returns the highest ranked first" do
  #     expect(Album.top_ten.first.ranking).to eq(Album.maximum(:ranking))
  #   end
  #
  #   it "returns the lowest ranked last" do
  #     expect(Album.top_ten.last.ranking).to eq(Album.minimum(:ranking))
  #   end
  # end

end
