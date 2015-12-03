require 'rails_helper'

RSpec.shared_examples "a medium" do
  describe ".validates" do
    it "must have a title" do
      medium = described_class.new
      expect(medium).to be_invalid
    end
  end
end
