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
      Book.create(name: "Some book")
    end

    it "renders the show view" do
      get :show, id: book.id
      expect(subject).to render_template :show
    end
  end

  describe "GET 'edit'" do
    let(:book) do
      Movie.create(name: "Some book")
    end

    it "renders the edit view" do
      get :edit, id: book.id
      expect(subject).to render_template :edit
    end
  end
end
