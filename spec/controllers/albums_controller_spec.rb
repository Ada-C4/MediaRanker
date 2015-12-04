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
end
