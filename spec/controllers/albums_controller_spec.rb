require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  let(:album_params) do {
        album: {
            name: "Love and Basketball",
            artist: "someone",
            description: "Athletes",
        }
    }
  end

  let(:album) { Album.create(album_params[:album]) }

  describe "GET 'index'" do
    it "is successful" do
      get :index
      expect(response.status). to eq 200
    end
  end

  describe "GET 'show'" do
    let(:album) do
      Album.create(name: "Test")
    end
  end

  describe "GET 'edit'" do
      it "is successful" do
        get :edit, id: album.id
        expect(response.status). to eq 200
      end
    end

  describe "GET 'new'" do
    it "renders new view" do
      get :new
      expect(subject).to render_template(:new)
    end
  end

  describe "POST 'create'" do
    let(:good_params) do
      {
        album: {
          name: "Something something something"
        }
      }
    end

    let (:bad_params) do
      {
        album: {
          name: nil
        }
      }
    end

    it "redirects to index page" do
      post :create, good_params

      # Success case to index page
      expect(subject).to redirect_to albums_path
    end

    it "renders new template on error" do
      # Error case to show errors on form
      post :create, bad_params
      expect(subject).to render_template(:new)
    end
  end

  describe "PATCH 'update'" do
    let(:update_params) do {

              name: "Lion King",
              artist: "someone",
              description: "Lions",

      }
    end
    it "redirects to show page" do
      patch :update,{ id: album.id, album: update_params }
      expect(subject).to redirect_to album_path(album.id)
      end
    end

  describe "DELETE 'destroy'" do
    it "redirects to index page" do
      delete :destroy, { id: album.id }
      expect(subject).to redirect_to albums_path
      end
    end

  describe "POST 'upvote'" do
    it "renders the show view" do
      post :upvote, { id: album.id }
      expect(subject).to render_template(:show)
    end
  end
end
