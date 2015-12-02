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
      Movie.create(name: "Test")
    end
  end

  describe "GET 'edit'" do
      it "is successful" do
        get :edit
        expect(response.status). to eq 200
      end
    end

  describe "GET 'new'" do
    it "renders new view" do
      get :new
      expect(subject).to render_template :new
    end
  end

  describe "POST 'create'" do
    let(:good_params) do
    {
      movie: {
        name: "Something something something"
      }
    }
    end

    let (:bad_params) do
      {
        movie: {}
      }
    end

  it "redirects to index page" do
    post :create, good_params

    # Success case to index page
    expect(subject).to redirect_to movies_path
  end

  it "renders new template on error" do
    # Error case to show errors on form
    post :create, bad_params
    expect(subject).to render_template :new
  end
end

  describe "PATCH 'update'" do
  end

  describe "DELETE 'destroy'" do
  end

  describe "POST 'upvote'" do
  end
end
