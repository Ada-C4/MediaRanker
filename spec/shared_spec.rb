require 'rails_helper'

RSpec.shared_examples "media" do |parameter|
  # :nocov:
  describe ".validates" do
    let(:item) { parameter }
    it "must have a name" do
      expect(item).to_not be_valid
    end
  end
  # :nocov:
end
