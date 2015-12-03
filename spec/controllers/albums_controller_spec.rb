require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  it_behaves_like "media"

  describe "GET 'new'" do
    it "renders new view" do
      get :new
      expect(subject).to render_template :new
    end
  end

  describe "POST 'create'" do
    let(:good_params) do
      {
        album: {
          title: "Title",
          artist: "Artist",
          description: "Description"
        }
      }
    end

    let(:bad_params) do
      {
        album: {
        }
      }
    end

    it "redirects to show view" do
      post :create, good_params
      new_album = Album.last
      expect(subject).to redirect_to album_path(id: new_album.id)
    end

    it "renders new template on error" do
      post :create, bad_params
      expect(subject).to render_template :new
    end
  end

  describe "GET 'show'" do
    let(:album) do
      Album.create(title: "Test")
    end

    it "renders the show view" do
      get :show, id: album.id
      expect(subject).to render_template :show
    end
  end

  describe "GET 'edit'" do
    let(:album) do
      Album.create(title: "Test")
    end

    it "renders the edit view" do
      get :edit, id: album.id
      expect(subject).to render_template :edit
    end
  end

  describe "PATCH 'update'" do
    let(:good_params) do
      {
        album: {
          title: "Title",
          artist: "Artist",
          description: "Description"
        }
      }
    end

    let(:album) do
      Album.create(good_params[:album])
    end

    let(:good_edit_params) do
      {
        id: album.id,
        album: {
          title: "Changed Title",
          artist: "Changed Artist",
          description: "Changed Description"
        }
      }
    end

    let(:bad_edit_params) do
      {
        id: album.id,
        album: {
          title: ""
        }
      }
    end

    it "redirects to show view" do
      patch :update, good_edit_params
      expect(subject).to redirect_to album_path(album.id)
    end

    it "renders edit template on error" do
      patch :update, bad_edit_params
      expect(subject).to render_template :edit
    end
  end

  describe "DELETE 'destroy'" do
    let(:album) do
      Album.create(title: "Test")
    end

    it "redirects to index view" do
      delete :destroy, id: album.id
      expect(subject).to redirect_to albums_path
    end
  end

  describe "PATCH 'upvote'" do
    before(:each) do
      request.env["HTTP_REFERER"] = "where_i_came_from"
    end

    let(:album) do
      Album.create(title: "Test")
    end

    it "refreshes the page" do
      patch :upvote, id: album.id
      expect(subject).to redirect_to "where_i_came_from"
    end
  end

end
