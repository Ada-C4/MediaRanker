require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do

	describe AlbumsController do
	  describe "GET 'index'" do

	    it "is successful" do
	      get :index
	      expect(response.status).to eq 200
	    end

	  end

	  describe "GET 'show'" do
	  	let(:album) do
	  		Album.create(name: 'an album')
	  	end
	  	it "renders the show view" do
	  		get :show, id: album.id
	  		expect(response.status).to eq 200
	  	end
	  end

    describe "POST 'create'" do
    	let(:params) do
    		{
    			album: 
    			{
    				name: "this is a name"
    			}
    		}
    	end

    	let(:bad_params) do
    		{
    			album:
    			{
    				description: 'this'
    			}
    		}
    	end

    	# item created properly
    	it "redirects to index page" do
    		post :create, params
    		expect(subject).to redirect_to album_path(1)
    	end

    	# error in creation
    	it "renders new template" do
    		post :create, bad_params
    		expect(subject).to render_template("new")
    	end
    end

    describe "PATCH 'update" do
    	let(:params) do
    		{
    			id: 1,
    			album: 
    			{
    				name: "this is a name",
    				description: 'description',
    			}
    		}
    	end
    	it 'updates with new name' do
    		album = Album.create(params[:album])
    		patch :update, params
    		expect(subject).to redirect_to album_path(1)
    	end
    	
    end

	end
end