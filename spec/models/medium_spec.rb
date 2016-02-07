require 'rails_helper'

RSpec.describe Medium, type: :model do
  # let(:type_class) { Medium.types[rand(0..2)].constantize }

  describe ".validates" do
    let(:no_name) { build(:nameless) }
    let(:no_type) { build(:typeless) }

    it "must have a name" do
      expect(no_name).to_not be_valid
      expect(no_name.errors.keys).to include(:name)
    end

    it "must have a type" do
      expect(no_type).to_not be_valid
      expect(no_type.errors.keys).to include(:type)
    end
  end
end
