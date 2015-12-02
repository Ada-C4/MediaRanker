require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  let(:create_params) do {
		movie: {
			name: "Harry Potter",
			description: "Magic"
		}
	}
  end
	let(:movie) { Movie.create(create_params[:movie]) }

  describe "GET index" do
    it "is successful" do
      get :index
      expect(response.status).to eq 200
    end
  end

  describe "GET new" do
    it "is successful" do
      get :new
      expect(response.status).to eq 200
    end
  end

  describe "GET show" do
    let(:movie) do
      Movie.create(name: "Brawn")
    end
    it "renders the show view" do
      get :show, id: movie.id
      expect(response.status).to eq 200
    end
  end

  describe "GET edit" do
    let(:movie) do
      Movie.create(name: "Prawn")
    end
    it "renders the edit view" do
      get :edit, id: movie.id
      expect(response.status).to eq 200
    end
  end

  describe "POST 'create'" do

    let(:bad_params) do
      {
        movie: {
          description: "the best"
        }
      }
    end

    it "redirects to show page" do
      post :create, create_params
      new_movie = Movie.last
      expect(subject).to redirect_to movie_path(new_movie)
    end

    it "renders new template" do
      post :create, bad_params
      expect(subject).to render_template("new")
    end
  end

  describe "PATCH 'update'" do
    let(:movie_id) { movie.id }
    let(:update_params) do
      {
        name: "Harry Potter",
        description: "Harry and friends fight evil"
      }
    end

    it "should should be successful" do
        patch :update, { id: movie_id, movie: update_params }
        expect(subject).to redirect_to movie_path(movie_id)
    end

  end


end
