require 'rails_helper'

RSpec.describe Medium, type: :model do
  describe ".validates" do
    let(:item) { Medium.new(name: nil, kind: nil) }
    it "must have a name" do
      expect(item).to_not be_valid
    end
    it "must have a kind" do
      expect(item).to_not be_valid
    end
  end
end
