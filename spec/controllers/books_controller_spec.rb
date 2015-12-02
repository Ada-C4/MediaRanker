require 'rails_helper'
require 'pry'

RSpec.describe BooksController, type: :controller do
  describe "GET 'index'" do
    it "is successful" do
      get :index
      expect(response).to have_http_status 200
    end
  end

  describe "GET 'new'" do
    it "renders new view" do
      get :new
      expect(subject).to render_template :new
    end
  end

  describe "GET 'edit'" do
    let (:edit_book) do
      Book.create!(title:"a", author: "b", description: "c", ranking: 0 )
    end

    it "renders edit view" do
      get :edit, id: edit_book.id
      expect(subject).to render_template :edit
    end
  end


  describe "GET 'show'" do
    let(:show_book) do
      Book.create!(title:"a", author: "b", description: "c", ranking: 0 )
    end

    it "renders the show view" do
      get :show, id: show_book.id
      expect(subject).to render_template :show
    end
  end


  describe "PATCH 'upvote'" do
    let(:upvote_book) do
      Book.create!(title:"a", author: "b", description: "c", ranking: 0 )
    end
   it "increments ranking" do
     patch :upvote, id: upvote_book.id
     upvote_book.reload
     expect(upvote_book.ranking).to eq 1
   end
   it "redirects to show" do
     patch :upvote, id: upvote_book.id
     expect(subject).to redirect_to book_path(upvote_book.id)
   end
  end


  describe "POST 'create'" do
    let(:good_params) do
    {
      book: {
        title: "a title",
        ranking: 0
      }
    }
    end

    let (:bad_params) do
      {
        book: {
          description: "a description",
          ranking: 0
        }
      }
    end

    it "redirects to show page for created book" do
      post :create, good_params
      new_book = Book.last
      expect(subject).to redirect_to book_path(new_book.id)
    end

    it "renders new template on error" do
      post :create, bad_params
      expect(subject).to render_template :new
    end
  end

  describe "POST 'update'" do
    let(:update_book) do
      Book.create!(title:"a", author: "b", description: "c", ranking: 0 )
    end

    let(:good_update_params) do
    {
      id: update_book.id,
      book: {
        title: "a title",
        ranking: 0
      }
    }
    end

    let (:bad_update_params) do
      {
        id: update_book.id,
        book: {
          title: nil,
          description: "a description",
          ranking: 0
        }
      }
    end

    it "redirects to show page for edited book" do
      post :update, good_update_params
      expect(subject).to redirect_to book_path(update_book.id)
    end

    it "renders edit form on error" do
      post :update, bad_update_params
      expect(subject).to render_template "edit"
    end
  end

  describe "DELETE 'destroy'" do
    let(:delete_book) do
      Book.create!(title:"a", author: "b", description: "c", ranking: 0 )
    end
    it "redirects to books index" do
      delete :destroy, {id: delete_book.id }
      expect(subject).to redirect_to books_path
    end
  end
end
