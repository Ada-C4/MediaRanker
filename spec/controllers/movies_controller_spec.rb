require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  it_behaves_like "a medium controller" do
    let(:model) do
      Movie
    end
    let(:medium) do
      Movie.create(name: "hello")
    end
    let(:good_params) do
      {
        movie: {
          name: "something something"
        }
      }
    end
    let(:bad_params) do
      {
        movie: {
          description: "something"
        }
      }
    end
  end

  describe "GET 'edit'" do
    let(:movie) do
      Movie.create(name: "hello")
    end

    it "renders edit view" do
      get :edit, id: movie.id
      expect(response.status).to eq 200
    end
  end

  describe "DELETE 'destroy'" do
    let(:movie) do
      Movie.create(name: "hello")
    end

    it "redirects to show view" do
      delete :destroy, id: movie.id
      expect(response.status).to eq 302
      expect(subject).to redirect_to movies_path
    end
  end

  describe "PATCH 'update'" do
    let(:good_params) do
      {
        id: 1,
        movie: {
          name: "hello"
        }
      }
    end

    let(:bad_params) do
      {
        id: 1,
        movie: {
          name: nil,
          description: "world"
        }
      }
    end

    it "successful update renders show view" do
      Movie.create(good_params[:movie])
      patch :update, good_params
      expect(response.status).to eq 200
      expect(subject).to render_template :show
    end

    it "unsuccessful update renders new view" do
      Movie.create(good_params[:movie])
      patch :update, bad_params
      expect(response.status).to eq 200
      expect(subject).to render_template :edit
    end
  end

  describe "PATCH 'upvote'" do
    let(:params) do
      {
        id: 1,
        movie: {
          name: "hello",
          ranking: 0
        }
      }
    end

    it "renders show view" do
      Movie.create(params[:movie])
      patch :upvote, params
      expect(response.status).to eq 200
      expect(subject).to render_template :show
    end
  end
end
