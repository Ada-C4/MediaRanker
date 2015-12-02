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
  end
end
