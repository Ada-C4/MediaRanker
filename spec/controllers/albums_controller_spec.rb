require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  it_behaves_like "a medium controller" do
    let(:model) do
      Album
    end
    let(:model_name) do
      "album"
    end
    let(:medium) do
      Album.create(name: "hello")
    end
    let(:good_params) do
      {
        id: 1,
        album: {
          name: "something something",
          ranking: 0
        }
      }
    end
    let(:bad_params) do
      {
        id: 1,
        album: {
          name: nil,
          description: "something"
        }
      }
    end
  end
end
