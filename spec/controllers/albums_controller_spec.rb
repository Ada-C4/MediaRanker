require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  it_behaves_like "a medium" do
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
