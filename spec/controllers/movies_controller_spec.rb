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

    let (:bad_params) do
      {
        movie: { name: "", description: "Movie's description", director: "Movie's director"
        }
      }
    end
  end

  # let (:movie) do
  #   Movie.create(name: "Test Movie", description: "Movie's description", director: "Movie's director")
  # end


  # describe "PATCH 'upvote'" do
  #   it "increases ranked by 1" do
  #     patch :upvote, id: movie.id
  #     expect(Movie.find(movie.id).ranked).to eq 1
  #   end
  #
  #   it "redirects to show page" do
  #     patch :upvote, id: movie.id
  #     expect(subject).to redirect_to movie_path(movie)
  #   end
  # end
end
