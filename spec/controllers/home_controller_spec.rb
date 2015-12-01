require 'rails_helper'

RSpec.describe HomeController, type: :controller do

	describe HomeController do
	  describe "GET 'all_media'" do

	    it "is successful" do
	      get :all_media
	      expect(response.status).to eq 200
	    end

	  end
	end

end