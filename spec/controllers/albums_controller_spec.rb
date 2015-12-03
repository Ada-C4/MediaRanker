require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  let(:album) do
    Album.create(name: "Some album")
  end

  describe "GET 'index'" do
    it "is successful" do
      get :index
      expect(response.status).to eq 200
    end
  end

  describe "GET 'new'" do
    it "renders the new view" do
      get :new, id: album.id
      expect(subject).to render_template :new
    end
  end

  describe "GET 'show'" do
    it "renders the show view" do
      get :show, id: album.id
      expect(subject).to render_template :show
    end
  end

  describe "GET 'edit'" do
    it "renders the edit view" do
      get :edit, id: album.id
      expect(subject).to render_template :edit
    end
  end

  describe "POST 'create'" do
    let(:params) do
      {
        album:{
          name: "Something something something"
        }
      }
    end

    let(:bad_params) do
      {
        album:{
          name: nil
        }
      }
    end

    it "redirects to albums index page" do
      post :create, params
      # Success case to index page
      expect(subject).to redirect_to albums_path
      # Error case to
      post :create, bad_params
      expect(subject).to render_template :new
    end
  end

  describe "DELETE 'destroy'" do
    let(:params) do
      {
        id: album.id
      }
    end

    it "deletes a book" do
      expect(Album.all). to include(album)
      delete :destroy, params
      expect(Album.all).to_not include(album)
    end

    it "renders the all albums view" do
      get :index
      expect(subject).to render_template :index
    end
  end

end
