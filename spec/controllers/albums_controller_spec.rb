require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  describe "GET 'index'" do
    it "is successful" do
      get :index
      expect(response.status).to eq 200
    end
  end

  describe "GET 'new'" do
    it "is successful" do
      get :new
      expect(response.status).to eq 200
    end
  end

  describe "GET 'show/:id'" do
    let(:album) do
      Album.create(name: "hello")
    end

    it "renders show view" do
      get :show, id: album.id
      expect(response.status).to eq 200
    end
  end

  describe "POST 'create'" do
    let(:params) do
      {
        album: {
          id: 1,
          name: "something something"
        }
      }
    end

    it "redirects to show page" do
      post :create, params
      expect(subject).to redirect_to album_path(params[:album][:id])
    end
  end

  describe "GET 'edit'" do
    let(:album) do
      Album.create(name: "hello")
    end

    it "renders edit view" do
      get :edit, id: album.id
      expect(response.status).to eq 200
    end
  end

  describe "DELETE 'destroy'" do
    let(:album) do
      Album.create(name: "hello")
    end

    it "redirects to show view" do
      delete :destroy, id: album.id
      expect(subject).to redirect_to albums_path
    end
  end

  describe "PATCH 'update'" do
    let(:params) do
      {
        id: 1,
        album: {
          name: "hello"
        }
      }
    end

    it "renders show view" do
      Album.create(params[:album])
      patch :update, params
      expect(response.status).to eq 200
    end
  end

  describe "POST 'upvote'" do
    let(:params) do
      {
        id: 1,
        album: {
          name: "hello",
          ranking: 0
        }
      }
    end

    it "renders show view" do
      Album.create(params[:album])
      post :upvote, params
      expect(response.status).to eq 200
    end
  end

end
