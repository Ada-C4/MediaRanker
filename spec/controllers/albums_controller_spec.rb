require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  it_behaves_like "a medium controller" do
    let(:model) { Album }
    let (:good_params) do
      {
        album: { name: "zzzTest", description: "Album's description", artist: "Album's artist"
        }
      }
    end

    let (:bad_params) do
      {
        album: { name: "", description: "Album's description", artist: "Album's artist"
        }
      }
    end
  end

  # let (:album) do
  #   Album.create(name: "Test Album", description: "Album's description", artist: "Album's artist")
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
