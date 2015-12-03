require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  it_behaves_like "a medium controller" do
    let(:good_params) do
      {
        album:{
          name: "Songs", artist: "You", description: "A Good Album", rank: 0
        }
      }
    end
    let(:bad_params) do
      {
      album:{
       artist: "Me", description: "So many good songs", rank: 0
      }
    }
    end
    let(:media_type) do
      :album
    end
    let(:media_type_plural) do
      :albums
    end
    let(:test_medium) do
      Album.create( name: "An album", artist: "You", description: "SONGS", rank: 0 )
    end
      let(:good_update_params) do
        {
          id: test_medium.id,
          album:{
            name: "Songs", artist: "You", description: "SONGS", rank: 0
          }
        }
      end

      let(:bad_update_params) do
        {
          id: test_medium.id,
          album: { name: nil, artist: "You", description: "A Good Album", rank: 0 }
      }
      end
  end
end
