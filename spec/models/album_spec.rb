require 'rails_helper'

RSpec.describe Album, type: :model do
  it_behaves_like "a medium"

  it "artist cannot have 101 characters" do
    expect(Album.new(name: "a", artist: "a" * 101)).to be_invalid
  end

  it "director can have 100 characters" do
    expect(Album.new(name: "a", artist: "a" * 100)).to be_valid
  end

end
