require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  describe "GET 'index'" do
    it "is successful" do
      get :index
      expect(response.status).to eq 200
    end
  end

  describe "GET 'new'" do
    it "render new view" do
      get :new
      expect(subject).to render_template :new
    end
  end

  describe "GET 'edit'" do
      let(:book) do
        Book.create(name: "Test", author: "Me", description: "boring film", rank: 7)
      end

      it "renders edit view" do
        get :edit, id: book.id
        expect(subject).to render_template :edit
      end
    end

  describe "GET 'show'" do
    let(:post_something) do
      Book.create(name: "Test", author: "Me", description: "Test")
    end

    it "renders the show view" do
      get :show, id: post_something.id
      expect(subject).to render_template :show
    end
  end

  describe "POST 'create'" do
    let(:good_params) do
      {
        book: {
          name: "some name",
          author: "me",
          description: "some description"
        }
      }
    end

    let(:bad_params) do
      {
        book: {}
      }
    end

    it "redirect to index page" do
      post :create, good_params
      #success case
      expect(subject).to redirect_to books_path
    end

    it "render new template on error" do
      #Error case
      post :create, bad_params
      expect(subject).to render_template :new
    end
  end

  describe "PATCH 'update'" do
    let(:book) do
      Book.create(name: "some name", author: "me", description: "some description", rank: 0)
    end

    let(:good_params) do
      {
        id: book.id,
        book: {
          name: "some name",
          author: "me",
          description: "some description",
          rank: 0
        }
      }
    end

    let(:bad_params) do
      Book.create(name:nil, author: nil, description: nil)
      {
        id: book.id,
        book: {
          name: nil,
          author: nil,
          description: nil
        }
      }
    end

    let(:upvote_params) do
      Book.create(name: "some name", author: "me", description: "some description", rank: 0)
      {
        id: 1,
        class: "upvote",
        book: {
          name: "some name",
          author: "me",
          description: "some description",
          rank: 0
        }
      }
    end

    let(:upvote_i_params) do
      Book.create(name: "some name", author: "me", description: "some description", rank: 0)
      {
        id: 1,
        class: "upvote_i",
        book: {
          name: "some name",
          author: "me",
          description: "some description",
          rank: 0
        }
      }
    end

    it "redirect to index page" do
      patch :update,  good_params
      expect(subject).to redirect_to book_path
    end

    it "Upvote in show- render to show" do
      patch :update, upvote_params
      expect(subject).to render_template :show
    end

    it "Upvote in index - redirect to index" do
      patch :update, upvote_i_params
      expect(subject).to redirect_to books_path
    end
    #
    # it "render edit template on error" do
    #   patch :update, bad_params
    #   expect(subject).to render_template :edit
    # end

  end

  describe "DELETE 'destroy'" do
    let(:book) do
      Book.create(name: "some name", author: "me", description: "some description")
    end

    it "redirect to index after deleting" do
      delete :destroy, id: book.id
      expect(subject).to redirect_to books_path
    end

  end
end
