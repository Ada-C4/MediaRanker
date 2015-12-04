require 'rails_helper'

RSpec.describe MediaController, type: :controller do

  describe "GET #index" do
    it "renders the index view" do
      get :index, type: "Movie"
      expect(subject).to render_template :index
    end
  end

  describe "GET #new" do
    it "renders the new view" do
      get :new, type: "Movie"
      expect(subject).to render_template :new
    end
  end

  describe "GET #show" do
    let(:movie) do
      Medium.create(name: "Test", type: "Movie")
    end

    it "renders the show view" do
      get :show, type: "Movie", id: movie.id
      expect(subject).to render_template :show
    end
  end

end
