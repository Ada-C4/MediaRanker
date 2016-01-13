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

    let (:medium) { create(:album) }

    let (:bad_params) do
      {
        album: { name: "", description: "Album's description", artist: "Album's artist"
        }
      }
    end
  end
end
