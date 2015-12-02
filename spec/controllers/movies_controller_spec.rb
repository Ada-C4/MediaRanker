require 'rails_helper'
require 'pry'

RSpec.describe MoviesController, type: :controller do
  describe "GET 'index'" do
    it "is successful" do
      get :index
      expect(response).to have_http_status 200
    end
  end

  describe "GET 'new'" do
    it "renders new view" do
      get :new
      expect(subject).to render_template :new
    end
  end

  describe "GET 'edit'" do
    let (:edit_movie) do
      Movie.create!(title:"a", director: "b", description: "c", ranking: 0 )
    end

    it "renders edit view" do
      get :edit, id: edit_movie.id
      expect(subject).to render_template :edit
    end
  end


  describe "GET 'show'" do
    let(:show_movie) do
      Movie.create!(title:"a", director: "b", description: "c", ranking: 0 )
    end

    it "renders the show view" do
      get :show, id: show_movie.id
      expect(subject).to render_template :show
    end
  end


  describe "PATCH 'upvote'" do
    let(:upvote_movie) do
      Movie.create!(title:"a", director: "b", description: "c", ranking: 0 )
    end
   it "increments ranking" do
     patch :upvote, id: upvote_movie.id
     upvote_movie.reload
     expect(upvote_movie.ranking).to eq 1
   end
   it "redirects to show" do
     patch :upvote, id: upvote_movie.id
     expect(subject).to redirect_to movie_path(upvote_movie.id)
   end
  end


  describe "POST 'create'" do
    let(:good_params) do
    {
      movie: {
        title: "a title",
        ranking: 0
      }
    }
    end

    let (:bad_params) do
      {
        movie: {
          description: "a description",
          ranking: 0
        }
      }
    end

    it "redirects to show page for created movie" do
      post :create, good_params
      new_movie = Movie.last
      expect(subject).to redirect_to movie_path(new_movie.id)
    end

    it "renders new template on error" do
      post :create, bad_params
      expect(subject).to render_template :new
    end
  end

  describe "POST 'update'" do
    let(:update_movie) do
      Movie.create!(title:"a", director: "b", description: "c", ranking: 0 )
    end

    let(:good_update_params) do
    {
      id: update_movie.id,
      movie: {
        title: "a title",
        ranking: 0
      }
    }
    end

    let (:bad_update_params) do
      {
        id: update_movie.id,
        movie: {
          title: nil,
          description: "a description",
          ranking: 0
        }
      }
    end

    it "redirects to show page for edited movie" do
      post :update, good_update_params
      expect(subject).to redirect_to movie_path(update_movie.id)
    end

    it "renders edit form on error" do
      post :update, bad_update_params
      expect(subject).to render_template "edit"
    end
  end

  describe "DELETE 'destroy'" do
    let(:delete_movie) do
      Movie.create!(title:"a", director: "b", description: "c", ranking: 0 )
    end
    it "redirects to movies index" do
      delete :destroy, {id: delete_movie.id }
      expect(subject).to redirect_to movies_path
    end
  end
end
