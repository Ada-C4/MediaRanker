require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  it_behaves_like "a medium" do
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
