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
  #
  # describe "GET 'index'" do
  #   it "is successful" do
  #     get :index
  #     expect(response.status).to eq 200
  #   end
  # end
  #
  # describe "GET 'new'" do
  #   it "renders new view" do
  #     get :new
  #     expect(subject).to render_template :new
  #   end
  # end
  #
  # describe "GET 'show'" do
  #   let(:movie) do
  #     Movie.create(name: "Test")
  #   end
  #
  #   it "renders the show view" do
  #     get :show, id: movie.id
  #     expect(subject).to render_template :show
  #   end
  # end
  #
  # describe "POST 'create'" do
  #   let(:good_params) do
  #   {
  #     movie: {
  #       name: "Something something something"
  #     }
  #   }
  #   end
  #
  #   let (:bad_params) do
  #     {
  #       movie: {}
  #     }
  #   end
  #
  #   it "redirects to index page" do
  #
  #     post :create, good_params
  #     new_movie = Movie.last
  #
  #     # Success case to index page
  #     expect(subject).to redirect_to movie_path(new_movie.id)
  #   end
  #
  #   it "renders new template on error" do
  #     # Error case to show errors on form
  #     post :create, bad_params
  #     expect(subject).to render_template :new
  #   end
  # end
  #
  # describe "GET 'edit'" do
  #   let(:movie) do
  #     Movie.create(name: "Test")
  #   end
  #
  #   it "renders the edit view" do
  #     get :edit, id: movie.id
  #     expect(subject).to render_template :edit
  #   end
  # end
  #
  # describe "PATCH 'update'" do
  #   it "redirects to show page" do
  #     movie = Movie.create(name: "Something", director: "Someone", description: "Something something something")
  #     params =   {
  #       movie: {
  #         name: "Something",
  #         author: "Someone",
  #         description: "Something something something"
  #       },
  #       id: movie.id
  #     }
  #     patch :update, params
  #     expect(subject).to redirect_to movie_path(movie.id)
  #   end
  # end
  #
  # describe "DELETE 'destroy'" do
  #   let(:movie) do
  #     Movie.create(name: "Test")
  #   end
  #
  #   it "redirects to index page" do
  #     delete :destroy, id: movie.id
  #     expect(subject).to redirect_to movies_path
  #   end
  # end
  #
  # describe "POST 'upvote'" do
  #   it "redirects to show page when ranking is nil" do
  #     movie = Movie.create(name: "Something", director: "Someone", description: "Something something something")
  #     post :upvote, id: movie.id
  #     expect(subject).to redirect_to movie_path(movie.id)
  #   end
  #   it "redirects to show page when ranking is not nil" do
  #     movie = Movie.create(name: "Something", director: "Someone", description: "Something something something", ranking: 3)
  #     post :upvote, id: movie.id
  #     expect(subject).to redirect_to movie_path(movie.id)
  #   end
  # end
end
