require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  it_behaves_like "a medium controller" do

    let(:create_params) do
      {
        movie: {
          name: "Peter Pan",
          director: "J.M. Barrie",
          rank: 0
        }
      }
    end

    let(:bad_params) do
      {
        id: medium.id,
        movie: {
          name: ""
        }
      }
    end

    let(:update_params) do
      {
        id: medium.id,
        movie: {
          name: "Peter",
          director: "Wendy",
          rank: 0
        }
      }
    end

    let(:medium) do
      Movie.create(create_params[:movie])
    end

    let(:show_1) do
      movie_path(1)
    end
  end
end
