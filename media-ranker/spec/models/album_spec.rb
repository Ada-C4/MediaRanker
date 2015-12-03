require 'rails_helper'

RSpec.describe Album, type: :model do

  describe ".validates" do
    let (:album_data) do {title:"Lady in Satin", artist: "Billie Holiday", description: "I get along without you very well...."} end
    it "must have a title" do
      expect(Album.new(album_data.merge(title: nil))).to_not be_valid
    end
    it "must have a author" do
      expect(Album.new(album_data.merge(artist: nil))).to_not be_valid
    end
    it "must have a description" do
      expect(Album.new(album_data.merge(description: nil))).to_not be_valid
    end
  end

end
