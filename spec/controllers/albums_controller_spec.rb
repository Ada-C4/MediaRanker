require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
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
      Album.create(name: "Test", artist: "Me", description: "Test")
    end

    it "renders the show view" do
      get :show, id: post_something.id
      expect(subject).to render_template :show
    end
  end

  describe "POST 'create'" do
    let(:good_params) do
      {
        album: {
          name: "some name",
          artist: "me",
          description: "some description"
        }
      }
    end

    let(:bad_params) do
      {
        album: {}
      }
    end

    it "redirect to index page" do
      post :create, good_params
      #success case
      expect(subject).to redirect_to albums_path
    end

    it "render new template on error" do
      #Error case
      post :create, bad_params
      expect(subject).to render_template :new
    end
  end


  describe "PATCH 'update'" do
    let(:album) do
      Album.create(name: "some name", artist: "me", description: "some description")
    end

    let(:good_params) do
      {
        id: album.id,
        album: {
          name: "some name",
          artist: "me",
          description: "some description"
        }
      }
    end

    let(:bad_params) do
      Album.create(name:nil, artist: nil, description: nil)
      {
        id: album.id,
        album: {
          name: "",
          artist: "bla",
          description: ""
        }
      }
    end

    let(:upvote_params) do
      Album.create(name: "some name", artist: "me", description: "some description", rank: 0)
      {
        id: 1,
        class: "upvote",
        album: {
          name: "some name",
          artist: "me",
          description: "some description",
          rank: 0
        }
      }
    end


    let(:upvote_i_params) do
      Album.create(name: "some name", artist: "me", description: "some description", rank: 0)
      {
        id: 1,
        class: "upvote_i",
        album: {
          name: "some name",
          artist: "me",
          description: "some description",
          rank: 0
        }
      }
    end


    it "redirect to index page" do
      patch :update,  good_params
      expect(subject).to redirect_to album_path
    end

    it "Upvote in show- render to show" do
      patch :update, upvote_params
      expect(subject).to render_template :show
    end

    it "Upvote in index - redirect to index" do
      patch :update, upvote_i_params
      expect(subject).to redirect_to albums_path
    end

    it "render edit template on error" do
      patch :update, bad_params
      expect(subject).to redirect_to album_path
    end

  end

  describe "DELETE 'destroy'" do
    let(:album) do
      Album.create(name: "some name", artist: "me", description: "some description")
    end

    it "redirect to index after deleting" do
      delete :destroy, id: album.id
      expect(subject).to redirect_to albums_path
    end

  end


end
