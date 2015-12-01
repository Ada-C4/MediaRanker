require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  describe "GET new" do
    it "is successful" do
      get :new
      expect(response.status).to eq 200
    end
  end

  describe "GET show" do
    let(:movie) do
      Movie.create(name: "Brawn")
    end
    it "renders the show view" do
      get :show, id: movie.id
      expect(response.status).to eq 200
    end
  end

  describe "GET edit" do
    let(:movie) do
      Movie.create(name: "Prawn")
    end
    it "renders the edit view" do
      get :edit, id: movie.id
      expect(response.status).to eq 200
    end
  end


end
