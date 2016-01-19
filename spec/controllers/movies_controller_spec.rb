require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  let(:movie) { create(:factory_movie)}

  describe "GET 'home'" do
    it "is successful" do
      get :home
      expect(response.status).to eq 200
    end
  end


  describe "GET 'index'" do
    it "is successful" do
      get :index
      expect(response.status).to eq 200
    end
  end

  describe "GET 'new'" do
    it "renders the new view" do
      get :new, id: movie.id
      expect(subject).to render_template :new
    end
  end

  describe "GET 'show'" do
    it "renders the show view" do
      get :show, id: movie.id
      expect(subject).to render_template :show
    end
  end

  describe "GET 'edit'" do
    it "renders the edit view" do
      get :edit, id: movie.id
      expect(subject).to render_template :edit
    end
  end

  describe "POST 'create'" do
    let(:params) do
      {
        movie:{
          name: "Something something something"
        }
      }
    end

    let(:bad_params) do
      {
        movie:{
          name: nil
        }
      }
    end

    it "creates a movie" do
      last_movie = Movie.last
      post :create, params
      expect(Movie.last).to_not eq last_movie
    end

    it "does not create a movie when bad params are used" do
      last_movie = Movie.last
      post :create, bad_params
      expect(Movie.last).to eq last_movie
    end

    it "redirects to movies index page" do
      post :create, params
      # Success case to index page
      expect(subject).to redirect_to movies_path
      # Error case to
      post :create, bad_params
      expect(subject).to render_template :new
    end
  end

  describe "PATCH 'update'" do
    let(:params) do
      {
        movie:{
          name: "Something something something"
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

    it "updates the movie with good params" do
      before_update = movie.attributes
      patch :update, params
      movie.reload
      expect(movie.attributes).to_not eq before_update
    end

    it "does not update the movie with bad params" do
      before_update = movie.attributes
      patch :update, bad_params
      movie.reload
      expect(movie.attributes).to eq before_update
    end

    it "redirects to the movie's show page after a successful update" do
      patch :update, params
      # Success case to index page
      expect(subject).to redirect_to movie_path
      # Error case to
      patch :update, bad_params
      expect(subject).to render_template :edit
    end
  end

  describe "PATCH 'upvote'" do
    let(:params) do
      {
        movie:{
          name: "Something something something",
          rank: 0
        },
        id: movie.id
      }
    end

    it "increments the rank of a movie by 1" do
      before_upvote = movie.attributes
      patch :upvote, params
      movie.reload
      expect(movie.attributes).to_not eq before_upvote
    end
  end

  describe "DELETE 'destroy'" do
    let(:params) do
      {
        id: movie.id
      }
    end

    it "deletes a movie" do
      expect(Movie.all).to include(movie)
      delete :destroy, params
      expect(Movie.all).to_not include(movie)
    end

    it "renders the all movies view" do
      get :index
      expect(subject).to render_template :index
    end
  end

end
