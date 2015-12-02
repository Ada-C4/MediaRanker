require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  let(:create_params) do {
		book: {
			name: "Harry Potter",
			description: "Magic"
		}
	}
  end
	let(:book) { Book.create(create_params[:book]) }

  describe "GET index" do
    it "is successful" do
      get :index
      expect(response.status).to eq 200
    end
  end

  describe "GET new" do
    it "is successful" do
      get :new
      expect(response.status).to eq 200
    end
  end

  describe "GET show" do
    it "renders the show view" do
      get :show, id: book.id
      expect(response.status).to eq 200
    end
  end

  describe "GET edit" do
    it "renders the edit view" do
      get :edit, id: book.id
      expect(response.status).to eq 200
    end
  end

  describe "POST 'create'" do

    let(:bad_params) do
      {
        book: {
          description: "the best"
        }
      }
    end

    it "redirects to show page" do
      post :create, create_params
      new_book = Book.last
      expect(subject).to redirect_to book_path(new_book)
    end

    it "renders new template" do
      post :create, bad_params
      expect(subject).to render_template("new")
    end
  end

  describe "PATCH 'update'" do
    let(:book_id) { book.id }
    let(:update_params) do
      {
        name: "Harry Potter",
        description: "Harry and friends fight evil"
      }
    end

    it "should should be successful" do
        patch :update, { id: book_id, book: update_params }
        expect(subject).to redirect_to book_path(book_id)
    end
  end

  describe "DELETE 'destroy'" do
    let(:book) do
      Book.create(name: "Spawn")
    end
    it "redirects to the books index page" do
      delete :destroy, { id: book.id }
      expect(subject).to redirect_to books_path
    end
  end

end
