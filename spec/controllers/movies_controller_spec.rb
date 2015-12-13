require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  it_behaves_like "a medium controller" do
    let(:model) do
      Movie
    end
    let(:model_name) do
      "movie"
    end
    let(:medium) do
      Movie.create(name: "hello")
    end
    let(:good_params) do
      {
        movie_id: 1,
        id: 1,
        movie: {
          name: "something something",
          ranking: 0
        }
      }
    end
    let(:bad_params) do
      {
        id: 1,
        movie: {
          name: nil,
          description: "something"
        }
      }
    end
  end
end
