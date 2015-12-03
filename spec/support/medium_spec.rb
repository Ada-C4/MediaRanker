RSpec.shared_examples "a medium" do
  describe "model validations" do
    it "requires a name" do
      medium = described_class.new(name: nil)
      expect(medium).to be_invalid
      expect(medium.errors.keys).to include :name
    end
  end
end
