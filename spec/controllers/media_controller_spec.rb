require 'rails_helper'

RSpec.describe MediaController, type: :controller do

  let(:movie) do
    Medium.create(name: "Test", type: "Movie")
  end

  describe "GET #index" do
    it "renders the index view" do
      get :index, type: "Movie"
      expect(subject).to render_template :index
    end
  end

  describe "GET #new" do
    it "renders the new view" do
      get :new, type: "Movie"
      expect(subject).to render_template :new
    end
  end

  describe "GET #show" do

    it "renders the show view" do
      get :show, type: "Movie", id: movie.id
      expect(subject).to render_template :show
    end
  end


  describe "POST 'create'" do
    let(:params) do
      {
        movie: {
          name: "Test",
          type: "Movie"
        }
      }
    end

    let(:bad_params) do
      {
        movie: {
          description: "Test"
        }
      }
    end

    it "redirects to the show view" do
      post :create, params.merge(type: "Movie")
      expect(subject).to redirect_to polymorphic_path(Movie.all.last)
    end

    it "renders the new view if there is an error" do
      post :create, bad_params.merge(type: "Movie")
      expect(subject).to render_template :new
    end
  end

  describe "GET 'edit'" do
    it "renders the edit view" do
      get :edit, type: "Movie", id: movie.id
      expect(subject).to render_template :edit
    end
  end

  describe "PATCH 'update'" do
    let(:update_params) do
      {
        movie: {
          name: "Updated Test",
          type: "Movie"
        }
      }
    end

    it "redirects to the show view" do
      patch :update, { id: movie.id, movie: update_params, type: "Movie" }
      expect(subject).to redirect_to polymorphic_path(Movie.all.last)
    end
  end

end
