require 'rails_helper'

RSpec.describe Book, type: :model do
  describe ".validates" do
    it "must have a title" do
      expect(Book.new(title: nil)).to be_invalid
    end

    it "must have a unique title" do
      Book.create(title: "a")
      expect(Book.new(title: "a")).to be_invalid
    end

    it "cannot have a title with more than 100 characters" do
      expect(Book.new(title: "a" * 100)).to be_valid
      expect(Book.new(title: "a" * 101)).to be_invalid
    end

    it "cannot have an author with more than 100 characters" do
      expect(Book.new(title: "a", author: "a" * 100)).to be_valid
      expect(Book.new(title: "a", author: "a" * 101)).to be_invalid
    end

    it "cannot have a description with more than 1000 characters" do
      expect(Book.new(title: "a", description: "a" * 1000)).to be_valid
      expect(Book.new(title: "a", description: "a" * 1001)).to be_invalid
    end
  end
end
