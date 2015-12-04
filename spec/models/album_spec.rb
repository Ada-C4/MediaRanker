require 'rails_helper'

RSpec.describe Album, type: :model do
  describe ".validates" do
    it "has a name" do
      expect(Album.new(name: nil)).to_not be_valid
    end

    it "has a unique name" do
      Album.create(name: "a")
      expect(Album.new(name: "a")).to_not be_valid
    end
  end
end
