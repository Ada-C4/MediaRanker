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
           name: "Peter Pan",
           rank: 0
         }
       }
     end

     let(:bad_params) do
       {
         movie: {}
       }
     end

     it "redirects to show page" do
       post :create, good_params
       new_movie = Movie.last
       expect(subject).to redirect_to movie_path(new_movie.id)
     end

     it "renders new template on create error" do
       post :create, bad_params
       expect(subject).to render_template :new
     end
  end

  describe "GET 'edit'" do
    let(:movie) do
      movie = Movie.create(name: "Peter Pan")
    end

    it "renders edit view" do
      get :edit, id: movie.id
      expect(response.status).to eq 200
    end
  end

  describe "DELETE 'destroy'" do
    let(:movie) do
      movie = Movie.create(name: "Captain Hook")
    end

    it "redirects to index view" do
    delete :destroy, id: movie.id
    expect(subject).to redirect_to movies_path
    end
  end

  describe "PATCH 'update'" do
    let(:good_params) do
      {
        id: 1,
        movie: {
          name: "Peter Pan",
        }
      }
    end

    let(:bad_params) do
      {
        id: 1,
        movie: {
          name: nil,
          description: "Following the leader, the leader, the leader"
        }
      }
    end

    it "successful update renders show view" do
      movie = Movie.create(good_params[:movie])
        patch :update, good_params
        expect(response.status).to eq 200
        expect(subject).to render_template :show
      end

      it "unsuccessful update renders edit form" do
        movie = Movie.create(bad_params[:movie])
        patch :update, bad_params
        expect(subject).to render_template :edit
      end
    end

    describe "PATCH 'upvote'" do
      let(:good_params) do
        {
          id: 1,
          movie: {
            name: "Peter Pan",
            rank: 0
          }
        }
      end

      it "renders show view" do
        Movie.create(good_params[:movie])
        patch :upvote, good_params
        expect(response.status).to eq 200
        expect(subject).to redirect_to movie_path(1)
      end
    end
  end
