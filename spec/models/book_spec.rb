require 'rails_helper'

RSpec.describe Book, type: :model do
  describe ".validates" do
    it "must have a name" do
      expect(Book.new(name: nil)).to_not be_valid
    end
  end

end
