require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do

	let(:create_params) do {
		album: {
			name: "Some Album",
			description: "It's got music!",
			votes: 1
		}
	}
end

	let(:album) { Album.create(create_params[:album]) }

	describe AlbumsController do
	  describe "GET 'index'" do

	    it "is successful" do
	      get :index
	      expect(response.status).to eq 200
	    end
	  end

	  describe "GET 'new'" do
	  	it "renders the 'new' view" do
	  		get :new
	  		expect(subject).to render_template("new")
	  	end
	  end

	  describe "GET 'show'" do
	  	it "renders the show view" do
	  		get :show, id: album.id
	  		expect(response.status).to eq 200
	  	end
	  end

	  describe "POST 'create'" do

	  	let(:bad_params) do
	  		{ 
	  			album:
	  			{
	  				description: 'this'
	  			}
	  		}
	  	end

	  	# item created properly
	  	it "redirects to show page" do
	  		post :create, create_params
	  		expect(subject).to redirect_to album_path(1)
	  	end

	  	# error in creation
	  	it "renders new template" do
	  		post :create, bad_params
	  		expect(subject).to render_template("new")
	  	end
	  end

	 	describe "PATCH 'update'" do
			let(:album_id) { album.id }
			let(:update_params) do 
				{
						name: "Some Album",
						description: "It's got music that I don't like :("
				}
			end
			it "should should be successful" do
				patch :update, { id: album_id, album: update_params }
				expect(subject).to redirect_to album_path(album_id)
			end
			it "should reload the page if not validated" do
				patch :update, { id: album_id, album: {name: nil}}
				expect(subject).to redirect_to edit_album_path(album_id)
			end
		end

		describe "PATCH 'upvote'" do
			before(:each) do
			  request.env["HTTP_REFERER"] = 'back'
			end

			it "should redirect to same page" do
				patch :upvote, id: album.id
				expect(subject).to redirect_to 'back'
			end
		end

  	describe "DELETE 'destroy'" do
  		it "should redirect to albums page" do
			  delete :destroy, id: album.id
	  		expect(subject).to redirect_to albums_path
  		end
  	end

	end
end