require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  describe "GET 'index'" do
    it "is successful" do
      get :index
      expect(response.status).to eq 200
      expect(subject).to render_template :index
    end
  end

  describe "GET 'new'" do
    it "is successful" do
      get :new
      expect(response.status).to eq 200
      expect(subject).to render_template :new
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
    let(:good_params) do
      {
        album: {
          name: "something something"
        }
      }
    end
    let(:bad_params) do
      {
        album: {
          description: "something"
        }
      }
    end

    it "successful create redirects to show page" do
      post :create, good_params
      expect(response.status).to eq 302
      expect(subject).to redirect_to album_path(1)
    end

    it "unsuccessful create renders new page" do
      post :create, bad_params
      expect(response.status).to eq 200
      expect(subject).to render_template :new
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
      expect(response.status).to eq 302
      expect(subject).to redirect_to albums_path
    end
  end

  describe "PATCH 'update'" do
    let(:good_params) do
      {
        id: 1,
        album: {
          name: "hello"
        }
      }
    end

    let(:bad_params) do
      {
        id: 1,
        album: {
          name: nil,
          description: "world"
        }
      }
    end

    it "successful update renders show view" do
      Album.create(good_params[:album])
      patch :update, good_params
      expect(response.status).to eq 200
      expect(subject).to render_template :show
    end

    it "unsuccessful update renders new view" do
      Album.create(good_params[:album])
      patch :update, bad_params
      expect(response.status).to eq 200
      expect(subject).to render_template :edit
    end
  end

  describe "PATCH 'upvote'" do
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
      patch :upvote, params
      expect(response.status).to eq 200
      expect(subject).to render_template :show
    end
  end

end
