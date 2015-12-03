require 'rails_helper'
require 'simplecov'

RSpec.describe Book, type: :model do
  it_behaves_like "a medium" do
    let :described_class do
      Book
    end
  end # Ends it_behaves_like
end # End describe
