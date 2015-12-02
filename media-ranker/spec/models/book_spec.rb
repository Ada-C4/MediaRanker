require 'rails_helper'

RSpec.describe Book, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe ".validates" do
  it "must have a title" do
    expect(Book.new(title: nil)).to_not be_valid
  end
end


end
