require 'rails_helper'

RSpec.describe Book, type: :model do
  it_behaves_like "a medium"

  it "author cannot have 101 characters" do
    expect(Book.new(name: "a", author: "a" * 101)).to be_invalid
  end

  it "director can have 100 characters" do
    expect(Book.new(name: "a", author: "a" * 100)).to be_valid
  end

end
