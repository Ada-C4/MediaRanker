require 'rails_helper'

RSpec.describe Book, type: :model do
  it_behaves_like "a medium" do
  end
  # describe ".validates" do
  #   it "must have a name" do
  #     expect(Book.new(name: "Brittany")).to be_valid
  #   end
  # end
end
