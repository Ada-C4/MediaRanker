require 'rails_helper'

RSpec.describe MoviesController, type: :controller do

  let(:create_params) do {
    movie: {
      name: "This is a Movie!",
      description: "It has minutes",
      votes: 0
    }
  }
  end

  let(:movie) { Movie.create(create_params[:movie])}


  describe "GET 'index'" do
    it "is successful" do
      get :index
      expect(response.status).to eq 200
    end
  end

  describe "GET 'new'" do
    it "renders new view" do
      get :new
      expect(subject).to render_template :new
    end
  end

  describe "GET 'edit'" do
    it "renders edit view" do
      get :edit, id: movie.id
      expect(subject).to render_template :edit
    end
  end

  describe "GET 'show'" do
    it "renders show view" do
      get :show, id: movie.id
      expect(subject).to render_template :show
    end
  end

  describe "POST 'create'" do
    let(:bad_params) do
      {
        movie: {}
      }
    end

    it "redirects to the show page" do
      post :create, create_params
      expect(subject).to redirect_to movie_path(1)
    end

    it "renders the new template on error" do
      post :create, bad_params
      expect(subject).to render_template :new
    end
  end

  describe "PATCH 'update'" do
    let(:movie_id) { movie.id }
    let(:update_params) do {
        name: "This is a Movie!",
        description: "It has no minutes"
      }
    end

    it "should be successful" do
      patch :update, { id: movie_id, movie: update_params }
      expect(subject).to redirect_to movie_path(movie_id)
    end
  end

  describe "PATCH 'upvote'" do
    it "should be successful" do
      patch :upvote, { id: movie.id }
      expect(subject).to redirect_to movie_path(movie.id)
    end
  end

  describe "DELETE 'destroy'" do
    it "should be successful" do
      delete :destroy, { id: movie.id }
      expect(subject).to redirect_to movies_path
    end
  end

end
