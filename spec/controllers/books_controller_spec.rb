require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  describe "GET 'index'" do
    it "is successful" do
      get :index
      expect(response.status).to eq 200
    end
  end

  describe "GET 'new'" do
    it "renders a new view" do
      get :new
      expect(subject).to render_template :new
    end
  end

  describe "GET 'show'" do
    let(:book) do
      Book.create(name: "Test", author: "Me", description: "boring book", rank: 7)
    end

    it "renders the show view" do
      get :show, id: book.id
      expect(subject).to render_template :show
    end
  end

  describe "POST 'create'" do
    let(:book) do
      {
        book: {
          name: "Test",
          author: "Me",
          description: "boring book",
          rank: 7
        }
      }
    end

    let(:bad_book) do
      {
        book: {
          name: "",
          author: "Me",
          description: "boring book",
          rank: 7
        }
      }
    end

    it "redirects to books index page" do
      post :create, book
      expect(subject).to redirect_to books_path
    end

    it "redirects to books index on error" do
      post :create, bad_book
      expect(subject).to redirect_to books_path
    end
  end

  describe "GET 'edit'" do
    let(:book) do
      Book.create(name: "Test", author: "Me", description: "boring book", rank: 7)
    end

    it "renders edit view" do
      get :edit, id: book.id
      expect(subject).to render_template :edit
    end
  end

  describe "PATCH 'update'" do
    let(:book) do
      Book.create(name: "Test", author: "Me", description: "boring book", rank: 7)
    end

    let(:good_book) do
      {
        id: book.id,
        book: {
          name: "Test",
          author: "Me",
          description: "boring book",
          rank: 7
        }
      }
    end

    let(:bad_book) do
    {
      id: book.id,
      book: {
        name: "",
        author: "Me",
        description: "boring book",
        rank: 7
      }
    }
    end

    it "redirects to book show page" do
      patch :update, good_book
      expect(subject).to redirect_to book_path(book.id)
    end

    it "redirects to book show page on error" do
      patch :update, bad_book
      expect(subject).to redirect_to book_path(book.id)
    end
  end

  describe "DELETE 'destroy'" do
    let(:book) do
      Book.create(name: "Test", author: "Me", description: "boring book", rank: 7)
    end

    it "redirects to books index page" do
      delete :destroy, id: book.id
      expect(subject).to redirect_to books_path
    end
  end

  describe "PATCH 'upvote'" do
    let(:book) do
      Book.create(name: "Test", author: "Me", description: "boring book", rank: 7)
    end

    before :each do
      request.env["HTTP_REFERER"] = "from_whence_we_came"
    end
    it "increments :rank" do
      patch :upvote, id: book.id
      book.reload
      expect(book.rank).to eq 8
      expect(subject).to redirect_to "from_whence_we_came"
    end
  end
end
