require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  describe "GET 'index'" do
    it "is successful" do
      get :index
      expect(response.status).to eq 200
    end
  end

  describe "GET 'new'" do
    it "render new view" do
      get :new
      expect(subject).to render_template :new
    end
  end

  describe "GET 'show'" do
    let(:post_something) do
      Movie.create(name: "Test", director: "Me", description: "Test")
    end

    it "renders the show view" do
      get :show, id: post_something.id
      expect(subject).to render_template :show
    end
  end

  describe "POST 'create'" do
    let(:good_params) do
      {
        movie: {
          name: "some name",
          director: "me",
          description: "some description"
        }
      }
    end

    let(:bad_params) do
      {
        movie: {}
      }
    end

    it "redirect to index page" do
      post :create, good_params
      #success case
      expect(subject).to redirect_to movies_path
    end

    it "render new template on error" do
      #Error case
      post :create, bad_params
      expect(subject).to render_template :new
    end
  end

  describe "PATCH 'update'" do
    let(:movie) do
      Movie.create(name: "some name", director: "me", description: "some description")
    end

    let(:good_params) do
      {
        id: movie.id,
        movie: {
          name: "some name",
          director: "me",
          description: "some description"
        }
      }
    end

    let(:bad_params) do
      Movie.create(name:nil, director: nil, description: nil)
      {
        id: movie.id,
        movie: {
          name: nil,
          director: nil,
          description: nil
        }
      }
    end

    let(:upvote_params) do
      Movie.create(name: "some name", director: "me", description: "some description", rank: 0)
      {
        id: 1,
        class: "upvote",
        album: {
          name: "some name",
          director: "me",
          description: "some description",
          rank: 0
        }
      }
    end

    let(:upvote_i_params) do
      Movie.create(name: "some name", director: "me", description: "some description", rank: 0)
      {
        id: 1,
        class: "upvote_i",
        album: {
          name: "some name",
          director: "me",
          description: "some description",
          rank: 0
        }
      }
    end

    it "redirect to index page" do
      patch :update,  good_params
      expect(subject).to redirect_to movie_path
    end

    it "Upvote in show- render to show" do
      patch :update, upvote_params
      expect(subject).to render_template :show
    end

    it "Upvote in index- redirect to index" do
      patch :update, upvote_i_params
      expect(subject).to redirect_to movies_path
    end
    #
    # it "render edit template on error" do
    #   patch :update, bad_params
    #   expect(subject).to render_template :edit
    # end

  end

  describe "DELETE 'destroy'" do
    let(:movie) do
      Movie.create(name: "some name", director: "me", description: "some description")
    end

    it "redirect to index after deleting" do
      delete :destroy, id: movie.id
      expect(subject).to redirect_to movies_path
    end

  end

end
