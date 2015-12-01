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
    let (:good_params) do
      {
        album: { name: "Test Album", description: "Album's description", artist: "Album's artist"
        }
      }
    end

    let (:bad_params) do
      {
        album: { description: "Album's description", artist: "Album's artist"
        }
      }
    end

    it "redirects to show page" do
      post :create, good_params
      expect(subject).to redirect_to album_path(assigns(:album).id)
    end

    it "renders new template on error" do
      post :create, bad_params
      expect(subject).to render_template :new
    end
  end

  describe "GET 'edit'" do
    album = Album.create(name: "Test Album", description: "Album's description", artist: "Album's artist")

    it "renders edit view" do
      get :edit, id: album.id
      expect(subject).to render_template :edit
    end
  end

  describe "PATCH 'update'" do
    let (:album) do
      Album.create(name: "Test Album", description: "Album's description", artist: "Album's artist")
    end

    let (:good_params) do
      {
        id: album.id,
        album: { name: "zzzTest Album", description: "zzzzAlbum's description", artist: "zzzAlbum's artist"
        }
      }
    end

    let (:bad_params) do
      {
        id: album.id,
        album: { name: "", description: "Album's description", artist: "Album's artist"
        }
      }
    end

    it "redirects to show page" do
      patch :update, good_params
      expect(subject).to redirect_to album_path(album)
      expect(Album.find(album.id).name).to eq "zzzTest Album"
    end

    it "renders edit template on error" do
      patch :update, bad_params
      expect(subject).to render_template :edit
      expect(Album.find(album.id).name).to eq "Test Album"
    end


  end
end
