require 'rails_helper'

RSpec.describe BooksController, type: :controller do

		let(:create_params) do {
			book: {
				name: "Some book",
				description: "It's got music!"
			}
		}
	end

		let(:book) { Book.create(create_params[:book]) }

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

    	# item created properly
    	it "redirects to show page" do
    		post :create, params
    		expect(subject).to redirect_to book_path(1)
    	end

    	# error in creation
    	it "renders new template" do
    		post :create, bad_params
    		expect(subject).to render_template("new")
    	end
    end

   	describe "PATCH 'update'" do
  		let(:book_id) { book.id }
  		let(:update_params) do 
  			{
  					name: "Some book",
  					description: "It's got music that I don't like :("
  			}
  		end
  		it "should should be successful" do
  			patch :update, { id: book_id, books: update_params }
  			expect(subject).to redirect_to book_path(book_id)
  		end

  		it "should reload the page if name is set to nil" do
  			patch :update, { id: book_id, books: {name: nil}}
  			expect(subject).to redirect_to edit_book_path(book_id)
  		end
  	end


	end
end