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

    it "renders new template on error" do
      # Error case to show errors on form
      post :create, bad_params
      expect(subject).to render_template :new
    end
  end

  describe "PATCH 'update'" do

    it "redirects to show page" do
      album = Album.create(name: "Album", artist:"Artist", description:"Description")
      params = {
        album:{
          name: "something else",
          artist: "someone",
          description:"blablabla"
        },
        id: album.id
      }
      patch :update, params
      expect(subject).to redirect_to album_path(album.id)
    end

    # it "renders edit template on error" do
    #   patch :update, bad_params
    #   expect(subject).to render_template :edit
    # end
  end

end
