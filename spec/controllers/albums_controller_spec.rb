require 'rails_helper'
require 'simplecov'

RSpec.describe AlbumsController, type: :controller do
  it_behaves_like "a controller" do
    let(:params) do
      {
          album: {
          title: "a title",
          artist: "a music artist",
          description: "a description"
        }
      }
    end # Ends let
  end # Ends it_behaves_like
end # End describe
