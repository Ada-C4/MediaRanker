require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  it_behaves_like "a medium" do
    let(:params) do
      {
        movie: {
          title: "a title",
          artist: "a director",
          description: "a description"
        }
      }
    end # Ends let
  end # Ends it_behaves_like
end # End describe
