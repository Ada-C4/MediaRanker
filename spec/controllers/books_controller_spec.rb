require 'rails_helper'
require 'simplecov'

RSpec.describe BooksController, type: :controller do
  it_behaves_like "a controller" do
    let(:params) do
      {
        book: {
          title: "a title",
          artist: "an author",
          description: "a description"
        }
      }
    end # Ends let
  end # Ends it_behaves_like
end # End describe
