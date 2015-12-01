require 'rails_helper'

RSpec.describe Book, type: :model do
  describe ".validates" do
    it "must have a title" do
      expect(Book.new(name: nil)).to be_invalid
    end

    it "must have a number of votes" do
      expect(Book.new(name: "Book")).to be_invalid
      expect(Book.new(name: "Test Book", votes: 0)).to be_valid
    end
  end
end
