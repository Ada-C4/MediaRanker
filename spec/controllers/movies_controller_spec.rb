require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  describe "GET 'index'" do
    it "is successful" do
      get :index
      expect(response.status).to eq 200
    end
  end

  describe "GET 'show/:id'" do
    let(:movie) do
      Movie.create(name: "Some Title")
    end

    it "renders show view" do
      get :show, id: movie.id
      expect(response.status).to eq 200
    end
  end

  describe "GET 'new'" do
    it "is successful" do
      get :new
      expect(response).to be_success
    end
  end

  describe "GET 'edit'" do
    let(:movie) do
      Movie.create(name: "name")
    end
    it "is successful" do
      get :edit, id: movie.id
      expect(response.status).to eq 200
    end
  end

  describe "POST 'create'" do
    let(:good_params) do
      {
        movie: {
          name: "name"
        }
      }
    end

    let(:bad_params) do
      {
        movie: {
          name: nil
        }
      }
    end

    it "redirects to show page" do
      post :create, good_params
      #Success case to show page
      new_movie = Movie.last
      expect(subject).to redirect_to movie_path(new_movie.id)
    end

    it "renders new template on error" do
      # Error case to show errors on form
      post :create, bad_params
      expect(subject).to render_template :new
    end
  end

  describe "PATCH 'update'" do
    let(:movie) do
      Movie.create(name: "movie")
    end

    let(:good_params) do
      {
          movie:{
            name: "movie1"
          },
          id: movie.id
      }
    end

    let(:bad_params) do
      {
          movie:{
            name: nil
          },
          id: movie.id
      }
    end

    it "redirects to show page" do
      patch :update, good_params
      expect(subject).to redirect_to movie_path(movie.id)
    end

    it "renders edit template on error" do
      patch :update, bad_params
      expect(subject).to render_template :edit
    end
  end

  describe "DELETE 'destroy'" do
    let(:movie) do
      Movie.create(name: "name")
    end

    it "redirects to index page" do
      delete :destroy, id: movie.id
      expect(subject).to redirect_to(movies_path)
    end
  end

  describe "POST 'upvote'" do
    let(:movie) do
      Movie.create(name: "name", upvotes: 0)
    end

    it "incremements movie upvotes by 1" do
      post :upvote, id: movie.id
      movie.reload
      expect(movie.upvotes).to eq 1
    end
  end

end
