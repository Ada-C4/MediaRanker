require 'rails_helper'
require 'pry'

RSpec.describe AlbumsController, type: :controller do
  it_behaves_like "a medium"
  let(:model) { Album }
  let(:item) { Album.create!(title: "an album", ranking: 0) }


  let(:good_params) do
  {
    album: {
      title: "a title",
      ranking: 0
    }
  }
  end

  let (:bad_params) do
    {
      album: {
        description: "a description",
        ranking: 0
      }
    }
  end

  let(:good_update_params) do
  {
    id: item.id,
    album: {
      title: "a title",
      ranking: 0
    }
  }
  end


  let (:bad_update_params) do
    {
      id: item.id,
      album: {
        title: nil,
        description: "a description",
        ranking: 0
      }
    }
  end
end
