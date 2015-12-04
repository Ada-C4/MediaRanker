require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  it_behaves_like "a medium controller" do
    let(:medium) do
      Movie.create(name: "Something", director: "Someone", description: "Something something something")
    end

    let(:medium2) do
      Movie.create(name: "Something", director: "Someone", description: "Something something something", ranking: 3)
    end

    let(:model) do
      "Movie".constantize
    end

    let(:good_params) do
    {
      movie: {
        name: "Something something something"
      }
    }
    end
    
    let(:update_params) do
    {
      movie: {
        name: "Something",
        director: "Someone",
        description: "Something something something"
      },
      id: medium.id
    }
    end
  end
end
