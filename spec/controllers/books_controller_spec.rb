require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  it_behaves_like "a medium controller" do
    let(:model) { Book }
    let (:good_params) do
      {
        book: { name: "zzzTest", description: "Book's description", author: "Book's author"
        }
      }
    end

    let (:medium) { create(:book) }

    let (:bad_params) do
      {
        book: { name: "", description: "Book's description", author: "Book's author"
        }
      }
    end
  end
end
