require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  it_behaves_like "a medium controller"

  let (:book) do
    Book.create(name: "Test Book", description: "Book's description", author: "Book's author")
  end

  describe "GET 'show'" do
    it "renders the show view" do
      get :show, id: book.id
      expect(subject).to render_template :show
    end
  end

  describe "GET 'new'" do
    it "renders new view" do
      get :new
      expect(subject).to render_template :new
    end
  end

  describe "POST 'create'" do
    let (:good_params) do
      {
        book: { name: "Test Book", description: "Book's description", author: "Book's author"
        }
      }
    end

    let (:bad_params) do
      {
        book: { description: "Book's description", author: "Book's author"
        }
      }
    end

    it "redirects to show page" do
      post :create, good_params
      expect(subject).to redirect_to book_path(assigns(:book).id)
    end

    it "renders new template on error" do
      post :create, bad_params
      expect(subject).to render_template :new
    end
  end

  describe "GET 'edit'" do
    it "renders edit view" do
      get :edit, id: book.id
      expect(subject).to render_template :edit
    end
  end

  describe "PATCH 'update'" do
    let (:good_params) do
      {
        id: book.id,
        book: { name: "zzzTest Book", description: "zzzzBook's description", author: "zzzBook's author"
        }
      }
    end

    let (:bad_params) do
      {
        id: book.id,
        book: { name: "", description: "Book's description", author: "Book's author"
        }
      }
    end

    it "redirects to show page" do
      patch :update, good_params
      expect(subject).to redirect_to book_path(book)
      expect(Book.find(book.id).name).to eq "zzzTest Book"
    end

    it "renders edit template on error" do
      patch :update, bad_params
      expect(subject).to render_template :edit
      expect(Book.find(book.id).name).to eq "Test Book"
    end
  end

  describe "DELETE 'destroy'" do
    it "redirects to index page" do
      delete :destroy, id: book.id
      expect(subject).to redirect_to books_path
    end
  end

  describe "PATCH 'upvote'" do
    it "increases ranked by 1" do
      patch :upvote, id: book.id
      expect(Book.find(book.id).ranked).to eq 1
    end

    it "redirects to show page" do
      patch :upvote, id: book.id
      expect(subject).to redirect_to book_path(book)
    end
  end
end
