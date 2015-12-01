require 'rails_helper'

RSpec.describe BooksController, type: :controller do

	describe BooksController do
	  describe "GET 'index'" do

	    it "is successful" do
	      get :index
	      expect(response.status).to eq 200
	    end

	  end
	end

end