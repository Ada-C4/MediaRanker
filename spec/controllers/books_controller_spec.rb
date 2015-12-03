require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  it_behaves_like "a medium controller" do
    let(:create_params) do
      {
        book: {
          name: "Peter Pan",
          author: "J.M. Barrie",
          rank: 0
        }
      }
    end

    let(:bad_params) do
      {
        id: medium.id,
        book: {
          name: ""
        }
      }
    end

    let(:update_params) do
      {
        id: medium.id,
        book: {
          name: "Peter",
          author: "Wendy",
          rank: 0
        }
      }
    end

    let(:medium) do
      Book.create(create_params[:book])
    end

    let(:show_1) do
      book_path(1)
    end
  end
end
