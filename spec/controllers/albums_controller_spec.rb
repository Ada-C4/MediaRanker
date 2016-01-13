require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  it_behaves_like "a medium controller" do
    let(:medium) { create(:album1) }

    let(:medium2) { create(:album2) }

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
