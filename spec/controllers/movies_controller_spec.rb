require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  describe "GET 'index'" do
    it "is successful" do
      get :index
      expect(response.status).to eq 200
    end
  end

  describe "GET 'show'" do
    let(:movie) do
      Movie.create(name: "Peter Pan")
    end

    it "renders the show view for a move" do
      get :show, id: movie.id
      expect(subject).to render_template :show
    end
  end

  describe "POST 'create'" do
     let(:good_params) do
       {
         movie: {
           name: "Peter Pan"
         }
       }
     end

     let(:bad_params) do
       {
         movie: {}
       }
     end

     it "redirects to index page" do
       post :create, good_params

       expect(subject).to redirect_to movies_path
     end

     it "renders new template on create error" do
       post :create, bad_params
       expect(subject).to render_template :new
     end
  end
end
