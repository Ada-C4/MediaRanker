require 'rails_helper'

RSpec.describe BooksController, type: :controller do

  let(:create_params) do {
    book: {
      name: "This is a Book!",
      description: "It has chapters",
      votes: 0
    }
  }
  end

  let(:book) { Book.create(create_params[:book])}


  describe "GET 'index'" do
    it "is successful" do
      get :index
      expect(response.status).to eq 200
    end
  end

  describe "GET 'new'" do
    it "renders new view" do
      get :new
      expect(subject).to render_template :new
    end
  end

  describe "GET 'edit'" do
    it "renders edit view" do
      get :edit, id: book.id
      expect(subject).to render_template :edit
    end
  end

  describe "GET 'show'" do
    it "renders show view" do
      get :show, id: book.id
      expect(subject).to render_template :show
    end
  end

  describe "POST 'create'" do
    let(:bad_params) do
      {
        book: {}
      }
    end

    it "redirects to the show page" do
      post :create, create_params
      expect(subject).to redirect_to book_path(1)
    end

    it "renders the new template on error" do
      post :create, bad_params
      expect(subject).to render_template :new
    end
  end

  describe "PATCH 'update'" do
    let(:book_id) { book.id }
    let(:update_params) do {
        name: "This is a Book!",
        description: "It has no chapters"
      }
    end

    it "should be successful" do
      patch :update, { id: book_id, book: update_params }
      expect(subject).to redirect_to book_path(book_id)
    end
  end

  describe "PATCH 'upvote'" do
    it "should be successful" do
      patch :upvote, { id: book.id }
      expect(subject).to redirect_to book_path(book.id)
    end
  end

  describe "DELETE 'destroy'" do
    it "should be successful" do
      delete :destroy, { id: book.id }
      expect(subject).to redirect_to books_path
    end
  end

end
