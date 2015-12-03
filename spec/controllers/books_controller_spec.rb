require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  describe "GET 'index'" do
    it "is successful" do
      get :index
      expect(response.status).to eq 200
    end
  end

  describe "GET 'show/:id'" do
    let(:book) do
      Book.create(name: "Some Title")
    end

    it "renders show view" do
      get :show, id: book.id
      expect(response.status).to eq 200
    end
  end

  describe "GET 'new'" do
    it "is successful" do
      get :new
      expect(response).to be_success
    end
  end

  describe "GET 'edit'" do
    let(:book) do
      Book.create(name: "Book Name", author:"author", description:"description")
    end
    it "is successful" do
      get :edit, id: book.id
      expect(response.status).to eq 200
    end
  end

  describe "POST 'create'" do
    let(:good_params) do
      {
        book: {
          name: "Some Album Name",
          description: "description"
        }
      }
    end

    let(:bad_params) do
      {
        book: {
          name: nil,
          description: "something"
        }
      }
    end
    it "redirects to show page" do
      post :create, good_params
      #Success case to show page
      new_book = Book.last
      expect(subject).to redirect_to book_path(new_book.id)
    end

    it "renders new template on error" do
      # Error case to show errors on form
      post :create, bad_params
      expect(subject).to render_template :new
    end
  end




end
