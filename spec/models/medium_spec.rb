require 'rails_helper'

RSpec.describe Medium, type: :model do
  describe ".validates" do
    it "must have a name" do
      expect(Medium.new(name: nil)).to be_invalid
    end

    it "must have a type" do
      expect(Medium.new(type: nil)).to be_invalid
    end
  end
end
