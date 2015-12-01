require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  describe "GET 'index'" do
    it "renders the index view" do
      get :index
      expect(response.status).to eq 200
    end
  end

  describe "GET 'show'" do
    let(:movie) do
      Movie.create(name: "Test")
    end

    it "renders the show view" do
      get :show, id: movie.id
      expect(response.status).to eq 200
    end
  end
end
