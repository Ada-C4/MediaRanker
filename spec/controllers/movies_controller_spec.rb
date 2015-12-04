require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  let(:model) do
    "Movie".constantize
  end
  let(:good_params) do
    {
      movie: {
        title: "Hello, World!",
        creator: "Jennie"
      }
    }
  end
  let(:bad_params) do
    {
      movie: {
        title: "Hello, World!"
      }
    }
  end
  let(:update_params) do
    {
      id: new_medium.id,
      movie: {
        description: "Great product!" }
    }
  end
  let(:bad_update_params) do
    {
      id: new_medium.id,
      movie: {
        title: "" }
    }
  end
  it_behaves_like 'shared_tests'
end
