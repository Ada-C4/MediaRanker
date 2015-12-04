require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  let(:model) do
    "Book".constantize
  end
  let(:good_params) do
    {
      book: {
        title: "Hello, World!",
        creator: "Jennie"
      }
    }
  end
  let(:bad_params) do
    {
      book: {
        title: "Hello, World!"
      }
    }
  end
  let(:update_params) do
    {
      id: new_medium.id,
      book: {
        description: "Great product!" }
    }
  end
  let(:bad_update_params) do
    {
      id: new_medium.id,
      book: {
        title: "" }
    }
  end
  it_behaves_like 'shared_tests'
end
