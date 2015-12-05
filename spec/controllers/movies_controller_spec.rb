require 'rails_helper'
require 'simplecov'

RSpec.describe MoviesController, type: :controller do
  it_behaves_like "a controller" do
    let(:medium) do
      Movie.create(title: "dumb")
    end
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
