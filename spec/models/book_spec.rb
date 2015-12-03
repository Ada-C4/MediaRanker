require 'rails_helper'

RSpec.describe Book, type: :model do
  it_behaves_like "a medium"

  describe ".validates" do
    it "cannot have an author with more than 100 characters" do
      expect(Book.new(title: "a", author: "a" * 100)).to be_valid
      expect(Book.new(title: "a", author: "a" * 101)).to be_invalid
    end
  end
end
