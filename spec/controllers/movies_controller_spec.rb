require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  describe "GET 'index'" do
    it "is successful" do
      get :index
      expect(response.status). to eq 200
    end
  end

  describe "GET 'show'" do
    let(:movie) do
      Movie.find(1)
    end

    it "renders the show view" do
      get :show, movie.id
    end
  end
end
