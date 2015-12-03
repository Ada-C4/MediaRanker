require 'rails_helper'

RSpec.describe Movie, type: :model do
  it_behaves_like "a medium" do
  end
  # describe ".validates" do
  #   it "must have a name" do
  #     expect(Movie.new(name: "Brittany")).to be_valid
  #   end
  # end
end
