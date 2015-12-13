require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  it_behaves_like "a medium controller" do
    let(:model) do
      Book
    end
    let(:model_name) do
      "book"
    end
    let(:medium) do
      Book.create(name: "hello")
    end
    let(:good_params) do
      {
        book_id: 1,
        id: 1,
        book: {
          name: "something something",
          ranking: 0
        }
      }
    end
    let(:bad_params) do
      {
        id: 1,
        book: {
          name: nil,
          description: "something"
        }
      }
    end
  end
end
