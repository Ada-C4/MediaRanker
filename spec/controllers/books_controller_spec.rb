require 'rails_helper'


RSpec.describe BooksController, type: :controller do
  it_behaves_like "a medium controller" do
    let(:medium) do
      Book.create(name: "Something", author: "Someone", description: "Something something something")
    end

    let(:medium2) do
      Book.create(name: "Something", author: "Someone", description: "Something something something", ranking: 3)
    end

    let(:model) do
      "Book".constantize
    end

    let(:good_params) do
    {
      book: {
        name: "Something something something"
      }
    }
    end
    
    let(:update_params) do
    {
      book: {
        name: "Something",
        author: "Someone",
        description: "Something something something"
      },
      id: medium.id
    }
    end
  end
end
