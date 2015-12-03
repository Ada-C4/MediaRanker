require 'rails_helper'


RSpec.describe BooksController, type: :controller do
  it_behaves_like "a medium controller" do
    let(:medium) do
      Book.create(name: "Something", author: "Someone", description: "Something something something")
    end
    let(:model) do
      "Book".constantize
    end
    let(:good_params) do
    {
      book: {
        name: "Something something something"
      }
    }
    end
    let(:params) do
    {
      medium: {
        name: "Something",
        author: "Someone",
        description: "Something something something"
      },
      id: medium.id
    }
    end
  end

  # describe "GET 'index'" do
  #   it "is successful" do
  #     get :index
  #     expect(response.status).to eq 200
  #   end
  # end
  #
  # describe "GET 'new'" do
  #   it "renders new view" do
  #     get :new
  #     expect(subject).to render_template :new
  #   end
  # end

  # describe "GET 'show'" do
  #   let(:book) do
  #     Book.create(name: "Test")
  #   end
  #
  #   it "renders the show view" do
  #     get :show, id: book.id
  #     expect(subject).to render_template :show
  #   end
  # end

  # describe "POST 'create'" do
  #   let(:good_params) do
  #   {
  #     book: {
  #       name: "Something something something"
  #     }
  #   }
  #   end
  #
  #   let (:bad_params) do
  #     {
  #       book: {}
  #     }
  #   end
  #
  #   it "redirects to index page" do
  #
  #     post :create, good_params
  #     new_book = Book.last
  #
  #     # Success case to index page
  #     expect(subject).to redirect_to book_path(new_book.id)
  #   end
  #
  #   it "renders new template on error" do
  #     # Error case to show errors on form
  #     post :create, bad_params
  #     expect(subject).to render_template :new
  #   end
  # end
  #
  # describe "GET 'edit'" do
  #   let(:book) do
  #     Book.create(name: "Test")
  #   end
  #
  #   it "renders the edit view" do
  #     get :edit, id: book.id
  #     expect(subject).to render_template :edit
  #   end
  # end

  describe "PATCH 'update'" do
    it "redirects to show page" do
      book = Book.create(name: "Something", author: "Someone", description: "Something something something")
      params =   {
        book: {
          name: "Something",
          author: "Someone",
          description: "Something something something"
        },
        id: book.id
      }
      patch :update, params
      expect(subject).to redirect_to book_path(book.id)
    end
  end

  describe "DELETE 'destroy'" do
    let(:book) do
      Book.create(name: "Test")
    end

    it "redirects to index page" do
      delete :destroy, id: book.id
      expect(subject).to redirect_to books_path
    end
  end

  describe "POST 'upvote'" do
    it "redirects to show page" do
      book = Book.create(name: "Something", author: "Someone", description: "Something something something")
      post :upvote, id: book.id
      expect(subject).to redirect_to book_path(book.id)
    end
    it "redirects to show page" do
      book = Book.create(name: "Something", author: "Someone", description: "Something something something", ranking: 3)
      post :upvote, id: book.id
      expect(subject).to redirect_to book_path(book.id)
    end
  end
end
