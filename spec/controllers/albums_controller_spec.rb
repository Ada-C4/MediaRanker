require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  describe ".validates" do
    it "must have a title" do
      expect(Album.new(title: nil)).to_not be_valid
    end
  end
end
