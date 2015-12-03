require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  it_behaves_like "media" do
    let(:model) do
      Book
    end
    let(:good_params) do
      {
        book: {
          title: "Title",
          author: "Author",
          description: "Description"
        }
      }
    end

    let(:bad_params) do
      {
        book: {
        }
      }
    end
    let(:good_art) do
      Book.create(good_params[:book])
    end
    let(:good_edit_params) do
      {
        id: good_art.id,
        book: {
          title: "Changed Title",
          author: "Changed Author",
          description: "Changed Description"
        }
      }
    end

    let(:bad_edit_params) do
      {
        id: good_art.id,
        book: {
          title: ""
        }
      }
    end
  end
end
