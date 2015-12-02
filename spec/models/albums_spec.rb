require 'shared_spec'

RSpec.describe Album, type: :model do
  include_examples "media", Album.new(name: nil)
end
