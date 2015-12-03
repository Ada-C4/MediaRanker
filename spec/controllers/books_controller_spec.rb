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

    let (:bad_params) do
      {
        book: { name: "", description: "Book's description", author: "Book's author"
        }
      }
    end
  end

  # let (:book) do
  #   Book.create(name: "Test Book", description: "Book's description", author: "Book's author")
  # end

  #
  # describe "DELETE 'destroy'" do
  #   it "redirects to index page" do
  #     delete :destroy, id: book.id
  #     expect(subject).to redirect_to books_path
  #   end
  # end
  #
  # describe "PATCH 'upvote'" do
  #   it "increases ranked by 1" do
  #     patch :upvote, id: book.id
  #     expect(Book.find(book.id).ranked).to eq 1
  #   end
  #
  #   it "redirects to show page" do
  #     patch :upvote, id: book.id
  #     expect(subject).to redirect_to book_path(book)
  #   end
  # end
end
