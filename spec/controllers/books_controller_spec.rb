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
end
