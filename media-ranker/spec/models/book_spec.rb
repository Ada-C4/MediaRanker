require 'rails_helper'

RSpec.describe Book, type: :model do

  describe ".validates" do
    let (:book_data) do {title:"Harry Potter", author: "J.K. Rolling", description: "The best books evar"} end
    it "must have a title" do
      expect(Book.new(book_data.merge(title: nil))).to_not be_valid
    end
    it "must have a author" do
      expect(Book.new(book_data.merge(author: nil))).to_not be_valid
    end
    it "must have a description" do
      expect(Book.new(book_data.merge(description: nil))).to_not be_valid
    end
  end


end
