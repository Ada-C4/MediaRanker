require 'rails_helper'

RSpec.shared_examples "a medium" do
  describe "model validations" do
    it "requires a name" do
      medium = described_class.new
      expect(medium).to be_invalid
      expect(medium.errors.keys).to include :name
    end
  end
end

# RSpec.describe Movie, type: :model do
#   describe ".validates" do
#     it "must have a name" do
#       expect(Movie.new(name: nil)).to be_invalid
#     end
#   end
# end
