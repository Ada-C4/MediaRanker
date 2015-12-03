RSpec.shared_examples "a medium" do
  describe ".validates" do
    it "must have a name" do
      medium = described_class.new(name: nil)
      expect(medium).to_not be_valid
      expect(medium.errors.keys).to include :name
    end
  end
end
