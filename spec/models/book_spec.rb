require 'rails_helper'

RSpec.describe Book, type: :model do
  describe ".validates" do
    it "must have a book title" do
      expect(Book.new(name: nil)).to be_invalid
    end
  end

  
end
