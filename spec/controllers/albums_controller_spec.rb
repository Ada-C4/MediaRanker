require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  it_behaves_like "a medium controller" do
    let(:model) { Album }
    let (:good_params) do
      {
        album: { name: "Test Album", description: "Album's description", artist: "Album's artist"
        }
      }
    end

    let (:bad_params) do
      {
        album: { description: "Album's description", artist: "Album's artist"
        }
      }
    end
  end

  # let (:album) do
  #   Album.create(name: "Test Album", description: "Album's description", artist: "Album's artist")
  # end


  # describe "PATCH 'update'" do
  #   let (:good_params) do
  #     {
  #       id: album.id,
  #       album: { name: "zzzTest Album", description: "zzzzAlbum's description", artist: "zzzAlbum's artist"
  #       }
  #     }
  #   end
  #
  #   let (:bad_params) do
  #     {
  #       id: album.id,
  #       album: { name: "", description: "Album's description", artist: "Album's artist"
  #       }
  #     }
  #   end
  #
  #   it "redirects to show page" do
  #     patch :update, good_params
  #     expect(subject).to redirect_to album_path(album)
  #     expect(Album.find(album.id).name).to eq "zzzTest Album"
  #   end
  #
  #   it "renders edit template on error" do
  #     patch :update, bad_params
  #     expect(subject).to render_template :edit
  #     expect(Album.find(album.id).name).to eq "Test Album"
  #   end
  # end
  #
  # describe "DELETE 'destroy'" do
  #   it "redirects to index page" do
  #     delete :destroy, id: album.id
  #     expect(subject).to redirect_to albums_path
  #   end
  # end
  #
  # describe "PATCH 'upvote'" do
  #   it "increases ranked by 1" do
  #     patch :upvote, id: album.id
  #     expect(Album.find(album.id).ranked).to eq 1
  #   end
  #
  #   it "redirects to show page" do
  #     patch :upvote, id: album.id
  #     expect(subject).to redirect_to album_path(album)
  #   end
  # end
end
