require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  let(:book_params) do {
        book: {
            name: "Love and Basketball",
            author: "someone",
            description: "Athletes",
        }
    }
  end

  let(:book) { Book.create(book_params[:book]) }

  describe "GET 'index'" do
    it "is successful" do
      get :index
      expect(response.status). to eq 200
    end
  end

  describe "GET 'show'" do
    let(:book) do
      Book.create(name: "Test")
    end
  end

  describe "GET 'edit'" do
      it "is successful" do
        get :edit, id: book.id
        expect(response.status). to eq 200
      end
    end

  describe "GET 'new'" do
    it "renders new view" do
      get :new
      expect(subject).to render_template(:new)
    end
  end

  describe "POST 'create'" do
    let(:good_params) do
      {
        book: {
          name: "Something something something"
        }
      }
    end

    let (:bad_params) do
      {
        book: {
          name: nil
        }
      }
    end

    it "redirects to index page" do
      post :create, good_params

      # Success case to index page
      expect(subject).to redirect_to books_path
    end

    it "renders new template on error" do
      # Error case to show errors on form
      post :create, bad_params
      expect(subject).to render_template(:new)
    end
  end

  describe "PATCH 'update'" do
    let(:update_params) do {

              name: "Lion King",
              author: "someone",
              description: "Lions",

      }
    end
    it "redirects to show page" do
      patch :update,{ id: book.id, book: update_params }
      expect(subject).to redirect_to book_path(book.id)
      end
    end

  describe "DELETE 'destroy'" do
    it "redirects to index page" do
      delete :destroy, { id: book.id }
      expect(subject).to redirect_to books_path
      end
    end

  describe "POST 'upvote'" do
    it "renders the show view" do
      post :upvote, { id: book.id }
      expect(subject).to render_template(:show)
    end
  end
end
