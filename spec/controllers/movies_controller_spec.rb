require 'rails_helper'
require 'pry'

RSpec.describe MoviesController, type: :controller do
  it_behaves_like "media"
  let(:model) { Movie }
  let(:item) { Movie.create!(title: "an movie", ranking: 0) }

  let(:good_params) do
  {
    movie: {
      title: "a title",
      ranking: 0
    }
  }
  end

  let (:bad_params) do
    {
      movie: {
        description: "a description",
        ranking: 0
      }
    }
  end

  let(:good_update_params) do
  {
    id: item.id,
    movie: {
      title: "a title",
      ranking: 0
    }
  }
  end

  let (:bad_update_params) do
    {
      id: item.id,
      movie: {
        title: nil,
        description: "a description",
        ranking: 0
      }
    }
  end
end
