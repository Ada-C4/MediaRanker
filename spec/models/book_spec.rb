require 'rails_helper'

RSpec.describe Book, type: :model do
  describe ".validates" do
    it "must have a name" do
      book = Book.new(name: nil)
      expect(book).to_not be_valid
      expect(book.errors.keys).to include :name
    end
  end

end
