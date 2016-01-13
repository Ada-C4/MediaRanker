require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  it_behaves_like "a medium controller" do
    let(:model) { Movie }
    let (:good_params) do
      {
        movie: { name: "zzzTest", description: "Movie's description", director: "Movie's director"
        }
      }
    end

    let (:medium) { create(:movie) }

    let (:bad_params) do
      {
        movie: { name: "", description: "Movie's description", director: "Movie's director"
        }
      }
    end
  end
end
