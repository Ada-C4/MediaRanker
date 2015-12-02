require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  describe "GET 'index'" do
    it "renders the index view" do
      get :index
      expect(subject).to render_template :index
    end
  end

  describe "GET 'show'" do
    let(:book) do
      Book.create(name: "Test")
    end

    it "renders the show view" do
      get :show, id: book.id
      expect(subject).to render_template :show
    end
  end

  describe "GET 'new'" do
    it "renders the new view" do
      get :new
      expect(subject).to render_template :new
    end
  end

  describe "POST 'create'" do
    let(:params) do
      {
        book: {
          name: "Test"
        }
      }
    end

    let(:bad_params) do
      {
        book: {}
      }
    end

    it "redirects to the index view" do
      post :create, params
      expect(subject).to redirect_to book_path(1)
    end

    it "renders the new view if there is an error" do
      post :create, bad_params
      expect(subject).to render_template :new
    end
  end

  describe "GET 'edit'" do
    let(:book) do
      Book.create(name: "Test")
    end

    it "renders the edit view" do
      get :edit, id: book.id
      expect(subject).to render_template :edit
    end
  end

  describe "PATCH 'update'" do
    let(:book) do
      Book.create(name: "Test")
    end

    let(:update_params) do
      {
        book: {
          name: "Updated Test"
        }
      }
    end

    it "redirects to the show view" do
      patch :update, { id: book.id, book: update_params }
      expect(subject).to redirect_to book_path(book.id)
    end
  end

  describe "DELETE 'destroy'" do
    let(:book) do
      Book.create(name: "Test")
    end

    it "redirects to the index view" do
      delete :destroy, id: book.id
      expect(subject).to redirect_to books_path
    end
  end

  describe "PATCH 'upvote'" do
    let(:book) do
      Book.create(name: "Test")
    end

    let(:update_params) do
      {
        book: {
          upvotes: 1
        }
      }
    end

    it "redirects to the show view" do
      patch :upvote, { id: book.id, book: update_params }
      expect(subject).to redirect_to book_path(book.id)
    end
  end
end
