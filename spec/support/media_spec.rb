require 'rails_helper'

RSpec.shared_examples "media" do
	describe "model validations"  do
		it "must have a name" do
			media = described_class.new(name: nil)
			expect(media).to_not be_valid
			expect(media.errors.keys).to include :name
		end
	end
end