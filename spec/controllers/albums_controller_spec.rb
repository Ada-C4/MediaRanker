require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  describe "GET 'index'" do
    it "renders the index view" do
      get :index
      expect(subject).to render_template :index
    end
  end

  describe "GET 'show'" do
    let(:album) do
      Album.create(name: "Test")
    end

    it "renders the show view" do
      get :show, id: album.id
      expect(subject).to render_template :show
    end
  end

  describe "GET 'new'" do
    it "renders the new view" do
      get :new
      expect(subject).to render_template :new
    end
  end

  describe "POST 'create'" do
    let(:params) do
      {
        album: {
          name: "Test"
        }
      }
    end

    let(:bad_params) do
      {
        album: {}
      }
    end

    it "redirects to the index view" do
      post :create, params
      expect(subject).to redirect_to album_path(1)
    end

    it "renders the new view if there is an error" do
      post :create, bad_params
      expect(subject).to render_template :new
    end
  end

  describe "GET 'edit'" do
    let(:album) do
      Album.create(name: "Test")
    end

    it "renders the edit view" do
      get :edit, id: album.id
      expect(subject).to render_template :edit
    end
  end

  describe "PATCH 'update'" do
    let(:album) do
      Album.create(name: "Test")
    end

    let(:update_params) do
      {
        album: {
          name: "Updated Test"
        }
      }
    end

    it "redirects to the show view" do
      patch :update, { id: album.id, album: update_params }
      expect(subject).to redirect_to album_path(album.id)
    end
  end

  describe "DELETE 'destroy'" do
    let(:album) do
      Album.create(name: "Test")
    end

    it "redirects to the index view" do
      delete :destroy, id: album.id
      expect(subject).to redirect_to albums_path
    end
  end

  describe "PATCH 'upvote'" do
    let(:album) do
      Album.create(name: "Test")
    end

    let(:update_params) do
      {
        album: {
          upvotes: 1
        }
      }
    end

    it "redirects to the show view" do
      patch :upvote, { id: album.id, album: update_params }
      expect(subject).to redirect_to album_path(album.id)
    end
  end
end
