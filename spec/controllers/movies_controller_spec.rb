require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  let(:movie_params) do {
        movie: {
            name: "Love and Basketball",
            director: "someone",
            description: "Athletes",
        }
    }
  end

  let(:movie) { Movie.create(movie_params[:movie]) }

  describe "GET 'index'" do
    it "is successful" do
      get :index
      expect(response.status). to eq 200
    end
  end

  describe "GET 'show'" do
    let(:movie) do
      Movie.create(name: "Test")
    end
  end

  describe "GET 'edit'" do
      it "is successful" do
        get :edit, id: movie.id
        expect(response.status). to eq 200
      end
    end

  describe "GET 'new'" do
    it "renders new view" do
      get :new
      expect(subject).to render_template(:new)
    end
  end

  describe "POST 'create'" do
    let(:good_params) do
      {
        movie: {
          name: "Something something something"
        }
      }
    end

    let (:bad_params) do
      {
        movie: {
          name: nil
        }
      }
    end

    it "redirects to index page" do
      post :create, good_params

      # Success case to index page
      expect(subject).to redirect_to movies_path
    end

    it "renders new template on error" do
      # Error case to show errors on form
      post :create, bad_params
      expect(subject).to render_template(:new)
    end
  end

  describe "PATCH 'update'" do
    let(:update_params) do {

              name: "Lion King",
              director: "someone",
              description: "Lions",

      }
    end
    it "redirects to show page" do
      patch :update,{ id: movie.id, movie: update_params }
      expect(subject).to redirect_to movie_path(movie.id)
      end
    end

  describe "DELETE 'destroy'" do
    it "redirects to index page" do
      delete :destroy, { id: movie.id }
      expect(subject).to redirect_to movies_path
      end
    end

  describe "POST 'upvote'" do
    it "renders the show view" do
      post :upvote, { id: movie.id }
      expect(subject).to render_template(:show)
    end
  end
end
