require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  describe "GET 'index'" do
    it "is successful" do
      get :index
      expect(response.status).to eq 200
    end
  end

  describe "GET 'show'" do
    let(:album) do
      Album.create(name: "Peter Pan")
    end

    it "renders the show view for a move" do
      get :show, id: album.id
      expect(subject).to render_template :show
    end
  end

  describe "POST 'create'" do
     let(:good_params) do
       {
         album: {
           name: "Peter Pan",
           rank: 0
         }
       }
     end

     let(:bad_params) do
       {
         album: {}
       }
     end

     it "redirects to show page" do
       post :create, good_params
       album = Album.last
       expect(subject).to redirect_to album_path(album.id)
     end

     it "renders new template on create error" do
       post :create, bad_params
       expect(subject).to render_template :new
     end
  end

  describe "GET 'edit'" do
    let(:album) do
      album = Album.create(name: "Peter Pan")
    end

    it "renders edit view" do
      get :edit, id: album.id
      expect(response.status).to eq 200
    end
  end

  describe "DELETE 'destroy'" do
    let(:album) do
      album = Album.create(name: "Captain Hook")
    end

    it "redirects to index view" do
    delete :destroy, id: album.id
    expect(subject).to redirect_to albums_path
    end
  end

  describe "PATCH 'update'" do
    let(:good_params) do
      {
        id: 1,
        album: {
          name: "Peter Pan",
        }
      }
    end

    let(:bad_params) do
      {
        id: 1,
        album: {
          name: nil,
          description: "Following the leader, the leader, the leader"
        }
      }
    end

    it "successful update renders show view" do
      album = Album.create(good_params[:album])
        patch :update, good_params
        expect(response.status).to eq 200
        expect(subject).to render_template :show
      end

      it "unsuccessful update renders edit form" do
        album = Album.create(bad_params[:album])
        patch :update, bad_params
        expect(subject).to render_template :edit
      end
    end

    describe "PATCH 'upvote'" do
      let(:good_params) do
        {
          id: 1,
          album: {
            name: "Peter Pan",
            rank: 0
          }
        }
      end

      it "renders show view" do
        Album.create(good_params[:album])
        patch :upvote, good_params
        expect(response.status).to eq 200
        expect(subject).to redirect_to album_path(1)
      end
    end
  end
