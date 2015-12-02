require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do


  let(:create_params) do {
    album: {
      name: "This is an Album!",
      description: "It has songs",
      votes: 0
    }
  }
  end

  let(:bad_params) do
    {
      album: {}
    }
  end

  let(:album) { Album.create(create_params[:album])}


  describe "GET 'index'" do
    it "is successful" do
      get :index
      expect(response.status).to eq 200
    end
  end

  describe "GET 'new'" do
    it "renders new view" do
      get :new
      expect(subject).to render_template :new
    end
  end

  describe "GET 'edit'" do
    it "renders edit view" do
      get :edit, id: album.id
      expect(subject).to render_template :edit
    end
  end

  describe "GET 'show'" do
    it "renders show view" do
      get :show, id: album.id
      expect(subject).to render_template :show
    end
  end

  describe "POST 'create'" do
    it "redirects to the show page" do
      post :create, create_params
      expect(subject).to redirect_to album_path(1)
    end

    it "renders the new template on error" do
      post :create, bad_params
      expect(subject).to render_template :new
    end
  end

  describe "PATCH 'update'" do
    let(:album_id) { album.id }
    let(:update_params) do {
        name: "This is an Album!",
        description: "It has no songs"
      }
    end
    let(:bad_update_params) do {
      name: nil
    }
    end

    it "should be successful" do
      patch :update, { id: album_id, album: update_params }
      expect(subject).to redirect_to album_path(album_id)
    end

    it "renders the new template on error" do
      patch :update, { id: album_id, album: bad_update_params}
      expect(subject).to render_template :new
    end
  end

  describe "PATCH 'upvote'" do
    it "should be successful" do
      patch :upvote, { id: album.id }
      expect(subject).to redirect_to album_path(album.id)
    end
  end

  describe "DELETE 'destroy'" do
    it "should be successful" do
      delete :destroy, { id: album.id }
      expect(subject).to redirect_to albums_path
    end
  end

end
