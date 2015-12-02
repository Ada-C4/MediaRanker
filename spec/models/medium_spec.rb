require 'rails_helper'

RSpec.describe Medium, type: :model do
  include_examples "media", Medium.new(name: nil)
end
