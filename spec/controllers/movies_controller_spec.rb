require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
    describe "GET 'index'" do
      it "is successful" do
        get :index
        expect(response.status).to eq 200
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
        movie:{
          name: "Hello", director: "You", description: "A Good Movie", rank: 0
        }
      }
    end
    let(:bad_params) do
      {
      movie:{
       director: "You", description: "A Good Movie", rank: 0
      }
    }
    end
    it "redirects to show page" do
      post :create, good_params
      expect(subject).to redirect_to movie_path(assigns(:movie))
    end
    it "renders new template on error" do
      post :create, bad_params
      expect(subject).to render_template :new
    end
  end

  describe "GET 'show'" do
    test_movie = Movie.create( name: "Hello", director: "You", description: "A Good Movie", rank: 0 )

    it "renders the show view" do
      get :show, id: test_movie.id
      expect(subject).to render_template :show
    end
  end

  describe "GET 'edit'" do
    let(:test_movie){
      Movie.create( name: "Hello", director: "You", description: "A Good Movie", rank: 0 )
    }
    it "renders edit view" do
      get :edit, id: test_movie.id
      expect(subject).to render_template :edit
  end
end

describe "PATCH 'update'" do
  let(:good_params) do
    {
      id: 1,
      movie:{
        name: "Hello", director: "You", description: "A Good Movie", rank: 0
      }
    }
  end

  let(:bad_params) do
    {
      id: 1,
      movie: { name: nil, director: "You", description: "A Good Movie", rank: 0 }
  }
  end
  it "redirects to show page" do
    patch :update, good_params
    expect(subject).to redirect_to movie_path(assigns(:movie))
  end
  it "renders edit template on error" do
    patch :update, bad_params
    expect(subject).to render_template :edit
  end
end

describe "DELETE 'destroy'" do
  let(:test_movie){
    Movie.create( name: "Hello", director: "You", description: "A Good Movie", rank: 0 )
  }

  it "redirects to the index view" do
    delete :destroy, id: test_movie.id
    expect(subject).to redirect_to movies_path
  end
end

end
