require 'rails_helper'

RSpec.describe BooksController, type: :controller do

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
      id: book.id,
      book: {
        name: ""
      }
    }
  end

  let(:update_params) do
    {
      id: book.id,
      book: {
        name: "Peter",
        author: "Wendy",
        rank: 0
      }
    }

  end

  let(:book) do
    Book.create(create_params[:book])
  end

  describe "GET 'index'" do
    it "is successful" do
      get :index
      expect(response.status).to eq 200
    end
  end

  describe "GET 'show'" do
    it "renders the show view for a move" do
      get :show, id: book.id
      expect(subject).to render_template :show
    end
  end

  describe "POST 'create'" do
       it "redirects to show page" do
       post :create, create_params
       b = Book.last
       expect(subject).to redirect_to book_path(b.id)
     end

     it "renders new template on create error" do
       post :create, bad_params
       expect(subject).to render_template :new
     end
  end

  describe "GET 'edit'" do

    it "renders edit view" do
      get :edit, id: book.id
      expect(response.status).to eq 200
    end
  end

  describe "DELETE 'destroy'" do
    it "redirects to index view" do
    delete :destroy, id: book.id
    expect(subject).to redirect_to books_path
    end
  end

  describe "PATCH 'update'" do

    it "successful update renders show view" do
        patch :update, update_params
        expect(response.status).to eq 302
        expect(subject).to redirect_to book_path(book.id)
      end

      it "unsuccessful update renders edit form" do
        patch :update, bad_params
        expect(subject).to render_template :edit
      end
  end

  describe "PATCH 'upvote'" do

    it "renders show view" do
      patch :upvote, id: book.id
      book.reload
      expect(response.status).to eq 302
      expect(subject).to redirect_to book_path(book.id)
    end

    it "increments votes" do
      patch :upvote, id: book.id
      book.reload
      expect(book.rank).to eq 1
    end
  end
end
