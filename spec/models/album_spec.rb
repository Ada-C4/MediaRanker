require 'rails_helper'

RSpec.describe Album, type: :model do
  it_behaves_like "a medium"
  # describe ".validates" do
  #   it "must have a name" do
  #     expect(Album.new(name:"Album name")).to be_valid
  #     expect(Album.new(name: nil)).to be_invalid
  #   end
  # end
end
