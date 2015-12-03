require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  it_behaves_like "media" do
    let(:model) do
      Album
    end
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
    let(:good_art) do
      Album.create(good_params[:album])
    end
    let(:good_edit_params) do
      {
        id: good_art.id,
        album: {
          title: "Changed Title",
          artist: "Changed Artist",
          description: "Changed Description"
        }
      }
    end

    let(:bad_edit_params) do
      {
        id: good_art.id,
        album: {
          title: ""
        }
      }
    end
  end

end
