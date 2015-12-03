require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  it_behaves_like "a medium controller" do
    let(:model) do
      Book
    end
    let(:medium) do
      Book.create(name: "hello")
    end
    let(:good_params) do
      {
        book: {
          name: "something something"
        }
      }
    end
    let(:bad_params) do
      {
        book: {
          description: "something"
        }
      }
    end
  end

  describe "GET 'edit'" do
    let(:book) do
      Book.create(name: "hello")
    end

    it "renders edit view" do
      get :edit, id: book.id
      expect(response.status).to eq 200
    end
  end

  describe "DELETE 'destroy'" do
    let(:book) do
      Book.create(name: "hello")
    end

    it "redirects to show view" do
      delete :destroy, id: book.id
      expect(response.status).to eq 302
      expect(subject).to redirect_to books_path
    end
  end

  describe "PATCH 'update'" do
    let(:good_params) do
      {
        id: 1,
        book: {
          name: "hello"
        }
      }
    end

    let(:bad_params) do
      {
        id: 1,
        book: {
          name: nil,
          description: "world"
        }
      }
    end

    it "successful update renders show view" do
      Book.create(good_params[:book])
      patch :update, good_params
      expect(response.status).to eq 200
      expect(subject).to render_template :show
    end

    it "unsuccessful update renders new view" do
      Book.create(good_params[:book])
      patch :update, bad_params
      expect(response.status).to eq 200
      expect(subject).to render_template :edit
    end
  end

  describe "PATCH 'upvote'" do
    let(:params) do
      {
        id: 1,
        book: {
          name: "hello",
          ranking: 0
        }
      }
    end

    it "renders show view" do
      Book.create(params[:book])
      patch :upvote, params
      expect(response.status).to eq 200
      expect(subject).to render_template :show
    end
  end

end
