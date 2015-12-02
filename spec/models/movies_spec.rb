require 'shared_spec'

RSpec.describe Movie, type: :model do
  include_examples "media", Movie.new(name: nil)
end
