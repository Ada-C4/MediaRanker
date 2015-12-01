require 'rails_helper'

RSpec.describe Album, type: :model do

	describe ".validates" do
		it "must have a name" do
			album = Album.new(name: nil)
			expect(album).to_not be_valid
			expect(album.errors.keys).to include :name
		end
	end
end