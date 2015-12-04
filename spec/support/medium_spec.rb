RSpec.shared_examples "a medium" do
  describe ".validates" do
    it "must have a name" do
      expect(described_class.new(name: nil)).to_not be_valid
    end
  end
end
