require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  # it_behaves_like "media" do
  #   let(:good_params) do
  #     {
  #       book: {
  #         title: "Title",
  #         author: "Author",
  #         description: "Description"
  #       }
  #     }
  #   end
  #
  #   let(:bad_params) do
  #     {
  #       book: {
  #       }
  #     }
  #   end
  # end

  # describe "POST 'create'" do
  #   let(:good_params) do
  #     {
  #       book: {
  #         title: "Title",
  #         author: "Author",
  #         description: "Description"
  #       }
  #     }
  #   end
  #
  #   let(:bad_params) do
  #     {
  #       book: {
  #       }
  #     }
  #   end
  #
  #   it "redirects to show view" do
  #     post :create, good_params
  #     new_book = Book.last
  #     expect(subject).to redirect_to book_path(id: new_book.id)
  #   end
  #
  #   it "renders new template on error" do
  #     post :create, bad_params
  #     expect(subject).to render_template :new
  #   end
  # end

  describe "GET 'show'" do
    let(:book) do
      Book.create(title: "Test")
    end

    it "renders the show view" do
      get :show, id: book.id
      expect(subject).to render_template :show
    end
  end

  describe "GET 'edit'" do
    let(:book) do
      Book.create(title: "Test")
    end

    it "renders the edit view" do
      get :edit, id: book.id
      expect(subject).to render_template :edit
    end
  end

  describe "PATCH 'update'" do
    let(:good_params) do
      {
        book: {
          title: "Title",
          author: "Author",
          description: "Description"
        }
      }
    end

    let(:book) do
      Book.create(good_params[:book])
    end

    let(:good_edit_params) do
      {
        id: book.id,
        book: {
          title: "Changed Title",
          author: "Changed Author",
          description: "Changed Description"
        }
      }
    end

    let(:bad_edit_params) do
      {
        id: book.id,
        book: {
          title: ""
        }
      }
    end

    it "redirects to show view" do
      patch :update, good_edit_params
      expect(subject).to redirect_to book_path(book.id)
    end

    it "renders edit template on error" do
      patch :update, bad_edit_params
      expect(subject).to render_template :edit
    end
  end

  describe "DELETE 'destroy'" do
    let(:book) do
      Book.create(title: "Test")
    end

    it "redirects to index view" do
      delete :destroy, id: book.id
      expect(subject).to redirect_to books_path
    end
  end

  describe "PATCH 'upvote'" do
    before(:each) do
      request.env["HTTP_REFERER"] = "where_i_came_from"
    end

    let(:book) do
      Book.create(title: "Test")
    end

    it "refreshes the page" do
      patch :upvote, id: book.id
      expect(subject).to redirect_to "where_i_came_from"
    end
  end
end
