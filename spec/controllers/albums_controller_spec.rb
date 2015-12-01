require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  describe "GET 'index'" do
    it "is successful" do
      get :index
      expect(response.status).to eq 200
    end
  end

  describe "GET 'show'" do
    album = Album.create(name: "Test Album", description: "Album's description", artist: "Album's artist")

    it "renders the show view" do
      get :show, id: album.id
      expect(subject).to render_template :show
    end
  end

  describe "GET 'new'" do
    it "renders new view" do
      get :new
      expect(subject).to render_template :new
    end
  end

  describe "POST 'create'" do
    let (:params) do
      {
        album: { name: "Test Album", description: "Album's description", artist: "Album's artist"
        }
      }
    end

    it "redirects to show page" do
      post :create, params
      expect(subject).to redirect_to album_path(assigns(:album).id)
    end
  end
end
