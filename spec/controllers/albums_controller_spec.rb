require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  describe "GET 'index'" do
    it "is successful" do
      get :index
      expect(response.status).to eq 200
    end
  end

  describe "GET 'show/:id'" do
    let(:album) do
      Album.create(name: "Some Title")
    end

    it "renders show view" do
      get :show, id: album.id
      expect(subject).to render_template :show
    end

    it "is successful" do
      get :show, id: album.id
      expect(response.status).to eq 200
    end
  end

  describe "GET 'new'" do
    it "is successful" do
      get :new
      expect(response.status).to eq 200
    end
  end

  describe "GET 'edit'" do
    let(:album) do
      Album.create(name: "Album Name", artist:"Album artist")
    end

    it "is successful" do
      get :edit, id: album.id
      expect(response.status).to eq 200
    end
  end

  describe "POST 'create'" do
    let(:good_params) do
      {
        album: {
          name: "Some Album Name"
        }
      }
    end

    let(:bad_params) do
      {
        album: {
          description: "nameless album"
        }
      }
    end

    it "redirects to show page" do
      post :create, good_params
      #Success case to show page
      new_album = Album.last
      expect(subject).to redirect_to album_path(new_album.id)
    end

    it "renders new template on error" do
      # Error case to show errors on form
      post :create, bad_params
      expect(subject).to render_template :new
    end
  end

  describe "PATCH 'update'" do
    let(:album) do
      Album.create(name: "Album", artist:"Artist", description:"Description")
    end

    let(:good_params) do
      {
          album:{
            name: "something else",
            artist: "someone",
            description:"blablabla"
          },
          id: album.id
      }
    end

    let(:bad_params) do
      {
          album:{
            name: nil,
            artist: "someone",
            description:"blablabla"
          },
          id: album.id
      }
    end

    it "redirects to show page" do
      patch :update, good_params
      expect(subject).to redirect_to album_path(album.id)
    end

    it "renders edit template on error" do
      patch :update, bad_params
      expect(subject).to render_template :edit
    end
  end

  describe "DELETE 'destroy'" do
    let(:album) do
      Album.create(name: "Some Title")
    end

    it "redirects to album index page" do
      delete :destroy, id: album.id
      expect(subject).to redirect_to(albums_path)
    end
  end

  describe "POST 'upvote'" do
    let(:album) do
      Album.create(name: "Some Title", upvotes: 0)
    end

    it "incremements album upvotes by 1" do
      post :upvote, id: album.id
      album.reload
      expect(album.upvotes).to eq 1
    end

  end

end
