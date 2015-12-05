require 'rails_helper'
require 'simplecov'

RSpec.describe Album, type: :model do
  it_behaves_like "a medium" do
    let :described_class do
      Album
    end
  end # Ends it_behaves_like
end # End describe
