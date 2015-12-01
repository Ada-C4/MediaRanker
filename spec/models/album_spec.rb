require 'rails_helper'

RSpec.describe Album, type: :model do
  describe ".validates" do
    it "must have a title" do
      expect(Album.new(title: nil)).to be_invalid
    end

    it "must have a unique title" do
      Album.create(title: "a")
      expect(Album.new(title: "a")).to be_invalid
    end
  end
end
