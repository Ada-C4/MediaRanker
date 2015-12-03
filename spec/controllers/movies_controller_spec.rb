require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  it_behaves_like "a medium controller" do

    let(:create_params) do {
      movie: {
        name: "This is a Movie!",
        description: "It has minutes",
        votes: 0
      }
    }
    end

    let(:media) { Movie.create(create_params[:movie])}
    let(:media_id) { media.id }

    let(:bad_params) do
      {
        movie: {}
      }
    end

    let(:all_path) { movies_path }
    let(:show_path_1) { movie_path(1) }
    let(:show_path_id) { movie_path(media_id) }
    let(:type) { "movie" }

    let(:update_params) do {
        name: "This is a Movie!",
        description: "It has no minutes"
      }
    end

    let(:bad_update_params) do {
      name: nil
    }
    end
  end
end
