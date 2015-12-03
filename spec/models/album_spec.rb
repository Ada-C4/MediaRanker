require 'rails_helper'

RSpec.describe Album, type: :model do
  it_behaves_like "a medium" do

    describe ".validates" do
      it "must have a name" do
        expect(Album.new(name: "Brittany")).to be_valid
      end
    end
  end
end
