require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  let(:book) { create(:factory_book)}

  describe "GET 'index'" do
    it "is successful" do
      get :index
      expect(response.status).to eq 200
    end
  end

  describe "GET 'new'" do
    it "renders the new view" do
      get :new, id: book.id
      expect(subject).to render_template :new
    end
  end

  describe "GET 'show'" do
    it "renders the show view" do
      get :show, id: book.id
      expect(subject).to render_template :show
    end
  end

  describe "GET 'edit'" do
    it "renders the edit view" do
      get :edit, id: book.id
      expect(subject).to render_template :edit
    end
  end

  describe "POST 'create'" do
    let(:book_params) do
      {
        book:{
          name: "Something something something"
        }
      }
    end

    let(:bad_book_params) do
      {
        book:{
          name: nil
        }
      }
    end

    it "creates a book" do
      last_book = Book.last
      post :create, book_params
      expect(Book.last).to_not eq last_book
    end

    it "does not create a book when bad params are used" do
      last_book = Book.last
      post :create, bad_book_params
      expect(Book.last).to eq last_book
    end

    it "redirects to books index page" do
      post :create, book_params
      # Success case to index page
      expect(subject).to redirect_to books_path
      # Error case to
      post :create, bad_book_params
      expect(subject).to render_template :new
    end
  end

  describe "PATCH 'update'" do
    let(:params) do
      {
        book:{
          name: "Something something something"
        },
        id: book.id
      }
    end

    let(:bad_params) do
      {
        book:{
          name: nil
        },
        id: book.id
      }
    end

    it "updates the book with good params" do
      before_update = book.attributes
      patch :update, params
      book.reload
      expect(book.attributes).to_not eq before_update
    end

    it "does not update the book with bad params" do
      before_update = book.attributes
      patch :update, bad_params
      book.reload
      expect(book.attributes).to eq before_update
    end

    it "redirects to the book's show page after a successful update" do
      patch :update, params
      # Success case to index page
      expect(subject).to redirect_to book_path
      # Error case to
      patch :update, bad_params
      expect(subject).to render_template :edit
    end
  end

  describe "PATCH 'upvote'" do
    let(:params) do
      {
        id: book.id
      }
    end

    it "increments the rank of a book by 1" do
      before_upvote = book.attributes
      patch :upvote, params
      book.reload
      expect(book.attributes).to_not eq before_upvote
    end
  end

  describe "DELETE 'destroy'" do
    let(:params) do
      {
        id: book.id
      }
    end

    it "deletes a book" do
      expect(Book.all). to include(book)
      delete :destroy, params
      expect(Book.all).to_not include(book)
    end

    it "renders the all books view" do
      get :index
      expect(subject).to render_template :index
    end
  end

end
