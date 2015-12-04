require 'rails_helper'

RSpec.describe Book, type: :model do
  describe ".validates" do
    it "has a name" do
      expect(Book.new(name: nil)).to_not be_valid
    end

    it "has a unique name" do
      Book.create(name: "a")
      expect(Book.new(name: "a")).to_not be_valid
    end
  end
end
