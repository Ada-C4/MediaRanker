require 'rails_helper'

RSpec.describe Movie, type: :model do
  it_behaves_like "a medium"

  it "director cannot have 101 characters" do
    expect(Movie.new(name: "a", director: "a" * 101)).to be_invalid
  end

  it "director can have 100 characters" do
    expect(Movie.new(name: "a", director: "a" * 100)).to be_valid
  end

end
