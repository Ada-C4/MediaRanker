require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  it_behaves_like "media"

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

  describe "POST 'create'" do
    let(:good_params) do
      {
        movie: {
          title: "Title",
          director: "Director",
          description: "Description"
        }
      }
    end

    let(:bad_params) do
      {
        movie: {
        }
      }
    end

    it "redirects to show view" do
      post :create, good_params
      new_movie = Movie.last
      expect(subject).to redirect_to movie_path(id: new_movie.id)
    end

    it "renders new template on error" do
      post :create, bad_params
      expect(subject).to render_template :new
    end
  end

  describe "GET 'show'" do
    let(:movie) do
      Movie.create(title: "Test")
    end

    it "renders the show view" do
      get :show, id: movie.id
      expect(subject).to render_template :show
    end
  end

  describe "GET 'edit'" do
    let(:movie) do
      Movie.create(title: "Test")
    end

    it "renders the edit view" do
      get :edit, id: movie.id
      expect(subject).to render_template :edit
    end
  end

  describe "PATCH 'update'" do
    let(:good_params) do
      {
        movie: {
          title: "Title",
          director: "Director",
          description: "Description"
        }
      }
    end

    let(:movie) do
      Movie.create(good_params[:movie])
    end

    let(:good_edit_params) do
      {
        id: movie.id,
        movie: {
          title: "Changed Title",
          director: "Changed Director",
          description: "Changed Description"
        }
      }
    end

    let(:bad_edit_params) do
      {
        id: movie.id,
        movie: {
          title: ""
        }
      }
    end

    it "redirects to show view" do
      patch :update, good_edit_params
      expect(subject).to redirect_to movie_path(movie.id)
    end

    it "renders edit template on error" do
      patch :update, bad_edit_params
      expect(subject).to render_template :edit
    end
  end

  describe "DELETE 'destroy'" do
    let(:movie) do
      Movie.create(title: "Test")
    end

    it "redirects to index view" do
      delete :destroy, id: movie.id
      expect(subject).to redirect_to movies_path
    end
  end

  describe "PATCH 'upvote'" do
    before(:each) do
      request.env["HTTP_REFERER"] = "where_i_came_from"
    end

    let(:movie) do
      Movie.create(title: "Test")
    end

    it "refreshes the page" do
      patch :upvote, id: movie.id
      expect(subject).to redirect_to "where_i_came_from"
    end
  end
end
