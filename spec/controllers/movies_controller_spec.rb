require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  describe "GET 'index'" do
    it "renders the index view" do
      get :index
      expect(subject).to render_template :index
    end
  end

  describe "GET 'show'" do
    let(:movie) do
      Movie.create(name: "Test")
    end

    it "renders the show view" do
      get :show, id: movie.id
      expect(subject).to render_template :show
    end
  end

  describe "GET 'new'" do
    it "renders the new view" do
      get :new
      expect(subject).to render_template :new
    end
  end

  describe "POST 'create'" do
    let(:params) do
      {
        movie: {
          name: "Test"
        }
      }
    end

    let(:bad_params) do
      {
        movie: {}
      }
    end

    it "redirects to the index view" do
      post :create, params
      expect(subject).to redirect_to movie_path(1)
    end

    it "renders the new view if there is an error" do
      post :create, bad_params
      expect(subject).to render_template :new
    end
  end

  describe "GET 'edit'" do
    let(:movie) do
      Movie.create(name: "Test")
    end

    it "renders the edit view" do
      get :edit, id: movie.id
      expect(subject).to render_template :edit
    end
  end

  describe "PATCH 'update'" do
    let(:movie) do
      Movie.create(name: "Test")
    end

    let(:update_params) do
      {
        movie: {
          name: "Updated Test"
        }
      }
    end

    it "redirects to the show view" do
      patch :update, { id: movie.id, movie: update_params }
      expect(subject).to redirect_to movie_path(movie.id)
    end
  end

  describe "DELETE 'destroy'" do
    let(:movie) do
      Movie.create(name: "Test")
    end

    it "redirects to the index view" do
      delete :destroy, id: movie.id
      expect(subject).to redirect_to movies_path
    end
  end
end
