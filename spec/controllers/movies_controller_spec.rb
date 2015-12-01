require 'rails_helper'

RSpec.describe MoviesController, type: :controller do

	let(:create_params) do {
		movie: {
			name: "Some movie",
			description: "It's got music!"
		}
	}
end

	let(:movie) { Movie.create(create_params[:movie]) }

	describe MoviesController do
	  describe "GET 'index'" do

	    it "is successful" do
	      get :index
	      expect(response.status).to eq 200
	    end

	  end

	  describe "GET 'show'" do
	  	let(:movie) do
	  		Movie.create(name: 'a movie')
	  	end
	  	it "renders the show view" do
	  		get :show, id: movie.id
	  		expect(response.status).to eq 200
	  	end
	  end

    describe "POST 'create'" do
    	let(:params) do
    		{
    			movie: 
    			{
    				name: "this is a fdsf"
    			}
    		}
    	end

    	let(:bad_params) do
    		{
    			movie:
    			{
    				description: 'hello'
    			}
    		}
    	end

    	# item created properly
    	it "redirects to showd page" do
    		post :create, params
    		expect(subject).to redirect_to movie_path(1)
    	end

    	# error in creation
    	it "renders new template" do
    		post :create, bad_params
    		expect(subject).to render_template("new")
    	end
    end

     	describe "PATCH 'update'" do
		let(:movie_id) { movie.id }
		let(:update_params) do
			{
				id: movie_id,
				movie: {
					name: "Some movie",
					description: "It's got music that I don't like :("
				}
			}
		end
		it "should should be successful" do
			patch :update, update_params
			expect(subject).to redirect_to movie_path(movie_id)
		end
	end


	end
end