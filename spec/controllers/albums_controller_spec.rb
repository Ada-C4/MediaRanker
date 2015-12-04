require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  let(:good_params) do
    {
      album: {
        title: "Hello, World!",
        creator: "Jennie"
      }
    }
  end
  let(:bad_params) do
    {
      album: {
        title: "Hello, World!"
      }
    }
  end
  let(:update_params) do
    {
      id: new_medium.id,
      album: {
        description: "Great product!" }
    }
  end
  let(:bad_update_params) do
    {
      id: new_medium.id,
      album: {
        title: "" }
    }
  end
  let(:model) do
    "Album".constantize
  end
  it_behaves_like 'shared_tests'
end
