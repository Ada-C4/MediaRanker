require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  it_behaves_like "media" do
    let(:model) do
      Movie
    end
    let(:good_params) do
      {
        movie: {
          title: "Title",
          director: "Director",
          description: "Description"
        }
      }
    end

    let(:bad_params) do
      {
        movie: {
        }
      }
    end

    let(:good_art) do
      Movie.create(good_params[:movie])
    end
    let(:good_edit_params) do
      {
        id: good_art.id,
        movie: {
          title: "Changed Title",
          director: "Changed Director",
          description: "Changed Description"
        }
      }
    end

    let(:bad_edit_params) do
      {
        id: good_art.id,
        movie: {
          title: ""
        }
      }
    end
  end
end
