require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
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
    let(:movie) do
      Movie.create(name: "Some movie")
    end

    it "renders the new view" do
      get :new, id: movie.id
      expect(subject).to render_template :new
    end
  end

  describe "GET 'show'" do
    let(:movie) do
      Movie.create(name: "Some movie")
    end

    it "renders the show view" do
      get :show, id: movie.id
      expect(subject).to render_template :show
    end
  end

  describe "GET 'edit'" do
    let(:movie) do
      Movie.create(name: "Some movie")
    end

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

    it "redirects to movies index page" do
      post :create, params
      # Success case to index page
      expect(subject).to redirect_to movies_path
      # Error case to
      post :create, bad_params
      expect(subject).to render_template :new
    end
  end
end
