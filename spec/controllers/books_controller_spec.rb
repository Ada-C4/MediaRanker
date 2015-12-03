require 'rails_helper'

RSpec.describe BooksController, type: :controller do

  describe "GET 'index'" do
    it "is successful" do
      get :index
      expect(response.status).to eq 200
    end
  end

  describe "GET 'show'" do
    let(:book) do
      Book.create(name: "Peter Pan")
    end

    it "renders the show view for a move" do
      get :show, id: book.id
      expect(subject).to render_template :show
    end
  end

  describe "POST 'create'" do
     let(:good_params) do
       {
         book: {
           name: "Peter Pan",
           rank: 0
         }
       }
     end

     let(:bad_params) do
       {
         book: {}
       }
     end

     it "redirects to show page" do
       post :create, good_params
       book = Book.last
       expect(subject).to redirect_to book_path(book.id)
     end

     it "renders new template on create error" do
       post :create, bad_params
       expect(subject).to render_template :new
     end
  end

  describe "GET 'edit'" do
    let(:book) do
      book = Book.create(name: "Peter Pan")
    end

    it "renders edit view" do
      get :edit, id: book.id
      expect(response.status).to eq 200
    end
  end

  describe "DELETE 'destroy'" do
    let(:book) do
      book = Book.create(name: "Captain Hook")
    end

    it "redirects to index view" do
    delete :destroy, id: book.id
    expect(subject).to redirect_to books_path
    end
  end

  describe "PATCH 'update'" do
    let(:good_params) do
      {
        id: 1,
        book: {
          name: "Peter Pan",
        }
      }
    end

    let(:bad_params) do
      {
        id: 1,
        book: {
          name: nil,
          description: "Following the leader, the leader, the leader"
        }
      }
    end

    it "successful update renders show view" do
      book = Book.create(good_params[:book])
        patch :update, good_params
        expect(response.status).to eq 200
        expect(subject).to render_template :show
      end

      it "unsuccessful update renders edit form" do
        book = Book.create(bad_params[:book])
        patch :update, bad_params
        expect(subject).to render_template :edit
      end
    end

    describe "PATCH 'upvote'" do
      let(:good_params) do
        {
          id: 1,
          book: {
            name: "Peter Pan",
            rank: 0
          }
        }
      end

      it "renders show view" do
        Book.create(good_params[:book])
        patch :upvote, good_params
        expect(response.status).to eq 200
        expect(subject).to redirect_to book_path(1)
      end
    end
  end
