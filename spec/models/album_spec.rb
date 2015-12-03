require 'rails_helper'

RSpec.describe Album, type: :model do
  describe ".validates" do
    it "must have a name" do
      expect(Album.new(name: nil)).to_not be_valid
    end
  end
end
