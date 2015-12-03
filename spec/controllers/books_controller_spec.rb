require 'rails_helper'
require 'pry'

RSpec.describe BooksController, type: :controller do
  it_behaves_like "a medium"
  let(:model) { Book }
  let(:item) { Book.create!(title: "a book", ranking: 0) }


  let(:good_params) do
  {
    book: {
      title: "a title",
      ranking: 0
    }
  }
  end

  let (:bad_params) do
    {
      book: {
        description: "a description",
        ranking: 0
      }
    }
  end

  let(:good_update_params) do
  {
    id: item.id,
    book: {
      title: "a title",
      ranking: 0
    }
  }
  end


  let (:bad_update_params) do
    {
      id: item.id,
      book: {
        title: nil,
        description: "a description",
        ranking: 0
      }
    }
  end
end
