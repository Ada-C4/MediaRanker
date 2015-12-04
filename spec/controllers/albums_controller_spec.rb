require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  it_behaves_like "a medium controller" do

    let(:create_params) do {
      album: {
        name: "This is an Album!",
        description: "It has songs",
        votes: 0
      }
    }
    end

    let(:media) { Album.create(create_params[:album])}

    let(:bad_params) do
      {
        album: {}
      }
    end

    let(:update_params) do {
        name: "This is an Album!",
        description: "It has no songs"
      }
    end

    let(:bad_update_params) do {
      name: nil
    }
    end

    let(:show_path_1) { album_path(1) }

  end
end
