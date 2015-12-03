require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  it_behaves_like "a medium controller" do
    let(:medium) do
      Album.create(name: "Something", artist: "Someone", description: "Something something something")
    end
    let(:medium2) do
      Album.create(name: "Something", artist: "Someone", description: "Something something something", ranking: 3)
    end
    let(:model) do
      "Album".constantize
    end
    let(:good_params) do
    {
      album: {
        name: "Something something something"
      }
    }
    end
    let(:update_params) do
    {
      album: {
        name: "Something",
        author: "Someone",
        description: "Something something something"
      },
      id: medium.id
    }
    end
  end

  # describe "GET 'index'" do
  #     it "is successful" do
  #       get :index
  #       expect(response.status).to eq 200
  #     end
  #   end
  #
  #   describe "GET 'new'" do
  #     it "renders new view" do
  #       get :new
  #       expect(subject).to render_template :new
  #     end
  #   end
  #
  #   describe "GET 'show'" do
  #     let(:album) do
  #       Album.create(name: "Test")
  #     end
  #
  #     it "renders the show view" do
  #       get :show, id: album.id
  #       expect(subject).to render_template :show
  #     end
  #   end
  #
  #   describe "POST 'create'" do
  #     let(:good_params) do
  #     {
  #       album: {
  #         name: "Something something something"
  #       }
  #     }
  #     end
  #
  #     let (:bad_params) do
  #       {
  #         album: {}
  #       }
  #     end
  #
  #     it "redirects to index page" do
  #
  #       post :create, good_params
  #       new_album = Album.last
  #
  #       # Success case to index page
  #       expect(subject).to redirect_to album_path(new_album.id)
  #     end
  #
  #     it "renders new template on error" do
  #       # Error case to show errors on form
  #       post :create, bad_params
  #       expect(subject).to render_template :new
  #     end
  #   end
  #
  #   describe "GET 'edit'" do
  #     let(:album) do
  #       Album.create(name: "Test")
  #     end
  #
  #     it "renders the edit view" do
  #       get :edit, id: album.id
  #       expect(subject).to render_template :edit
  #     end
  #   end
  #
  #   describe "PATCH 'update'" do
  #     it "redirects to show page" do
  #       album = Album.create(name: "Something", artist: "Someone", description: "Something something something")
  #       params =   {
  #         album: {
  #           name: "Something",
  #           artist: "Someone",
  #           description: "Something something something"
  #         },
  #         id: album.id
  #       }
  #       patch :update, params
  #       expect(subject).to redirect_to album_path(album.id)
  #     end
  #   end
  #
  #   describe "DELETE 'destroy'" do
  #     let(:album) do
  #       Album.create(name: "Test")
  #     end
  #
  #     it "redirects to index page" do
  #       delete :destroy, id: album.id
  #       expect(subject).to redirect_to albums_path
  #     end
  #   end
  #
  #   describe "POST 'upvote'" do
  #     it "redirects to show page" do
  #       album = Album.create(name: "Something", artist: "Someone", description: "Something something something")
  #       post :upvote, id: album.id
  #       expect(subject).to redirect_to album_path(album.id)
  #     end
  #     it "redirects to show page" do
  #       album = Album.create(name: "Something", artist: "Someone", description: "Something something something", ranking: 3)
  #       post :upvote, id: album.id
  #       expect(subject).to redirect_to album_path(album.id)
  #     end
  #   end
end
