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
  end
end
