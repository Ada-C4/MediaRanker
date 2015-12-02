require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do

  let(:create_params) do {
		album: {
			name: "Harry Potter",
			description: "Magic"
		}
	}
  end
	let(:album) { Album.create(create_params[:album]) }

  describe "GET new" do
    it "is successful" do
      get :new
      expect(response.status).to eq 200
    end
  end

  describe "GET show" do
    let(:album) do
      Album.create(name: "Brawn")
    end
    it "renders the show view" do
      get :show, id: album.id
      expect(response.status).to eq 200
    end
  end

  describe "GET edit" do
    let(:album) do
      Album.create(name: "Prawn")
    end
    it "renders the edit view" do
      get :edit, id: album.id
      expect(response.status).to eq 200
    end
  end

  describe "POST 'create'" do

    let(:bad_params) do
      {
        album: {
          description: "the best"
        }
      }
    end

    it "redirects to show page" do
      post :create, create_params
      new_album = Album.last
      expect(subject).to redirect_to album_path(new_album.id)
    end

    it "renders new template" do
      post :create, bad_params
      expect(subject).to render_template("new")
    end
  end

  describe "PATCH 'update'" do
    let(:album_id) { album.id }
    let(:update_params) do
      {
        name: "Harry Potter",
        description: "Harry and friends fight evil"
      }
    end

    it "should should be successful" do
        patch :update, { id: album_id, album: update_params }
        expect(subject).to redirect_to album_path(album_id)
    end

  end


end
