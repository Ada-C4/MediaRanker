require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  let(:book) do
    Book.create(name: "Some book")
  end

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
    let(:params) do
      {
        book:{
          name: "Something something something"
        }
      }
    end

    let(:bad_params) do
      {
        book:{
          name: nil
        }
      }
    end

    it "redirects to books index page" do
      post :create, params
      # Success case to index page
      expect(subject).to redirect_to books_path
      # Error case to
      post :create, bad_params
      expect(subject).to render_template :new
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
