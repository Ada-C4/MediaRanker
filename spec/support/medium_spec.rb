RSpec.shared_examples "a medium" do
  describe "model validations" do
    it "must have a title" do
      medium = described_class.new

      expect(medium).to be_invalid
      expect(medium.errors.keys).to include :name
    end

    it "must have a number of votes" do
      medium = described_class.new

      expect(medium).to be_invalid
      expect(described_class.new(name: "Test Movie", votes: 0)).to be_valid
    end
  end
end
