require 'rails_helper'

RSpec.describe Album, type: :model do
  describe ".validates" do
    it "must have an album title" do
      expect(Album.new(name: nil)).to be_invalid
    end
  end


end
