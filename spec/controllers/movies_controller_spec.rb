require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  it_behaves_like "a medium controller" do

    let(:params) do
      {
        id: 1,
        movie: {
          name: "Peter Pan",
          director: "J.M. Barrie",
          description: "First star on the right and straight on 'till 'morn",
          rank: 0
        }
      }
    end

    let(:bad_params) do
      {
        id: 1,
        movie: {
          name: nil,
          description: "Tick Tock Tick Tock",
          rank: nil
        }
      }
    end

    let(:medium) do
      Movie.create(params[:movie])
    end
  end
end
