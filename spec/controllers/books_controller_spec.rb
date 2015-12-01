require 'rails_helper'

RSpec.describe BooksController, type: :controller do

	describe BooksController do

	  describe "GET 'index'" do

	    it "is successful" do
	      get :index
	      expect(response.status).to eq 200
	    end
	  end

	  describe "GET 'show'" do
	  	let(:book) do
	  		Book.create(name: 'a book')
	  	end
	  	it "renders the show view" do
	  		get :show, id: book.id
	  		expect(response.status).to eq 200
	  	end
	  end

    describe "POST 'create'" do
    	let(:params) do
    		{
    			books: 
    			{
    				name: "this is a name"
    			}
    		}
    	end

    	let(:bad_params) do
    		{
    			books:
    			{
    				description: 'this'
    			}
    		}
    	end

    	# works properly
    	it "redirects to index page" do
    		post :create, params
    		expect(subject).to redirect_to book_path(1)
    	end

    	# error creation
    	it "renders new template" do
    		post :create, bad_params
    		expect(subject).to render_template("new")
    	end
    end


	end
end