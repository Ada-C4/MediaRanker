require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  it_behaves_like "a medium controller" do
    let(:create_params) do
      {
        album: {
          name: "Peter Pan",
          artist: "J.M. Barrie",
          rank: 0
        }
      }
    end

    let(:bad_params) do
      {
        id: medium.id,
        album: {
          name: ""
        }
      }
    end

    let(:update_params) do
      {
        id: medium.id,
        album: {
          name: "Peter",
          artist: "Wendy",
          rank: 0
        }
      }

    end

    let(:medium) do
      Album.create(create_params[:album])
    end

    let(:show_1) do
      album_path(1)
    end
  end
end
