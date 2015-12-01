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
      expect(subject).to redirect_to book_path(10)
    end

    it "renders new template" do
      post :create, bad_params
      expect(subject).to render_template("new")
    end

  end




end
