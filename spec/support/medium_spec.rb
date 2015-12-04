require 'rails_helper'

RSpec.shared_examples "a medium" do
  describe ".validates" do
    it "must have a name" do
      expect(described_class.new(name: nil)).to_not be_valid
    end
  end

  it "name cannot have 101 characters" do
    expect(described_class.new(name: "a" * 101)).to be_invalid
  end

  it "name can have 100 characters" do
    expect(described_class.new(name: "a" * 100)).to be_valid
  end

  it "description cannot have 501 characters" do
    expect(described_class.new(name: "a", description: "a" * 501)).to be_invalid
  end

  it "description can have 500 characters" do
    expect(described_class.new(name: "a", description: "a" * 500)).to be_valid
  end
end
