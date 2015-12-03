require 'rails_helper'

RSpec.describe Medium, type: :model do
  let(:type_class) { Medium.types[rand(0..2)].constantize }

  describe ".validates" do
    let(:no_name) { type_class.new(name: nil) }
    let(:no_type) { type_class.new(name: "Generic Test", type: nil) }

    it "must have a name" do
      expect(no_name).to_not be_valid
    end

    it "must have a type" do
      expect(no_type).to_not be_valid
    end
  end
end
