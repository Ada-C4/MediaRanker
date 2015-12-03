require 'rails_helper'

RSpec.shared_examples "a medium" do
  describe ".validates" do
    it "requires a name" do
      medium = described_class.new

      expect(medium).to be_invalid
      expect(medium.errors.keys).to include :name
    end
  end
end
