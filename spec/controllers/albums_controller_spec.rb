require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  it_behaves_like "a medium controller"
  let(:model){Album}
end
