require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  describe "GET 'index'" do
    it "is successful" do
      get :index
      expect(response.status).to eq 200
    end
  end

  describe "GET 'new'" do
    it "renders a new view" do
      get :new
      expect(subject).to render_template :new
    end
  end

  describe "GET 'show'" do
    let(:album) do
      Album.create(name: "Test", artist: "Me", description: "boring album", rank: 7)
    end

    it "renders the show view" do
      get :show, id: album.id
      expect(subject).to render_template :show
    end
  end

  describe "POST 'create'" do
    let(:album) do
      {
        album: {
          name: "Test",
          artist: "Me",
          description: "boring album",
          rank: 7
        }
      }
    end

    let(:bad_album) do
      {
        album: {
          name: "",
          artist: "Me",
          description: "boring album",
          rank: 7
        }
      }
    end

    it "redirects to albums index page" do
      post :create, album
      expect(subject).to redirect_to albums_path
    end

    it "redirects to albums index on error" do
      post :create, bad_album
      expect(subject).to render_template :new
    end
  end

  describe "GET 'edit'" do
    let(:album) do
      Album.create(name: "Test", artist: "Me", description: "boring album", rank: 7)
    end

    it "renders edit view" do
      get :edit, id: album.id
      expect(subject).to render_template :edit
    end
  end

  describe "PATCH 'update'" do
    let(:album) do
      Album.create(name: "Test", artist: "Me", description: "boring album", rank: 7)
    end

    let(:good_album) do
      {
        id: album.id,
        album: {
          name: "Test",
          artist: "Me",
          description: "boring album",
          rank: 7
        }
      }
    end

    let(:bad_album) do
    {
      id: album.id,
      album: {
        name: "",
        artist: "Me",
        description: "boring album",
        rank: 7
      }
    }
    end

    it "redirects to album show page" do
      patch :update, good_album
      expect(subject).to redirect_to album_path(album.id)
    end

    it "redirects to album show page on error" do
      patch :update, bad_album
      expect(subject).to render_template :edit
    end
  end

  describe "DELETE 'destroy'" do
    let(:album) do
      Album.create(name: "Test", artist: "Me", description: "boring album", rank: 7)
    end

    it "redirects to albums index page" do
      delete :destroy, id: album.id
      expect(subject).to redirect_to albums_path
    end
  end

  describe "PATCH 'upvote'" do
    let(:album) do
      Album.create(name: "Test", artist: "Me", description: "boring album", rank: 7)
    end

    before :each do
      request.env["HTTP_REFERER"] = "from_whence_we_came"
    end
    it "increments :rank" do
      patch :upvote, id: album.id
      album.reload
      expect(album.rank).to eq 8
      expect(subject).to redirect_to "from_whence_we_came"
    end
  end
end
