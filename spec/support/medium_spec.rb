require 'rails_helper'

RSpec.shared_examples "a medium" do
  describe ".validates" do
    it "must have a title" do
      medium = described_class.new
      expect(medium).to be_invalid
    end

    it "must have a unique title" do
      described_class.create(title: "a")
      expect(described_class.new(title: "a")).to be_invalid
    end

    it "cannot have a title with more than 100 characters" do
      expect(described_class.new(title: "a" * 100)).to be_valid
      expect(described_class.new(title: "a" * 101)).to be_invalid
    end

    it "cannot have a description with more than 1000 characters" do
      expect(described_class.new(title: "a", description: "a" * 1000)).to be_valid
      expect(described_class.new(title: "a", description: "a" * 1001)).to be_invalid
    end
  end
end
