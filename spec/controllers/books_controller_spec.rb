require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  it_behaves_like "a medium controller" do

    let(:create_params) do {
      book: {
        name: "This is a Book!",
        description: "It has chapters",
        votes: 0
      }
    }
    end

    let(:media) { Book.create(create_params[:book])}

    let(:bad_params) do
      {
        book: {}
      }
    end

    let(:update_params) do {
        name: "This is a Book!",
        description: "It has no chapters"
      }
    end

    let(:bad_update_params) do {
      name: nil
    }
    end


    let(:show_path_1) { book_path(1) }

  end
end
