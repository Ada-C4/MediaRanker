require 'rails_helper'

RSpec.describe Book, type: :model do
  describe ".validates" do
    it "must have a title and an author" do
      expect(Book.new(title: "a", creator: nil)).to_not be_valid
      expect(Book.new(title: nil, creator: "a")).to_not be_valid
      expect(Book.new(title: "a", creator: "a")).to be_valid
    end
  end
end
