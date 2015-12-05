require 'rails_helper'

RSpec.shared_examples "a media controller" do

	
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
  		get :show, id: media.id
  		expect(response.status).to eq 200
  	end
  end

  describe "POST 'create'" do
  	# item created properly
  	it "redirects to show page" do
			post :create, create_params
  		expect(subject).to redirect_to polymorphic_path(model.all.last)
  	end

  	# error in creation
  	it "renders new template" do
  		post :create, bad_params
  		expect(subject).to render_template("new")
  	end
  end

 	describe "PATCH 'update'" do
		it "should should be successful" do
			patch :update, update_params
			expect(subject).to redirect_to polymorphic_path(media)
		end
		it "should reload the page if not validated" do
			patch :update, bad_params
			expect(subject).to redirect_to edit_polymorphic_path(media)
		end
	end

	describe "PATCH 'upvote'" do
		before(:each) do
		  request.env["HTTP_REFERER"] = 'back'
		end

		it "should redirect to same page" do
			patch :upvote, id: media.id
			expect(subject).to redirect_to 'back'
		end
	end

	describe "DELETE 'destroy'" do
		it "should redirect to media show page" do
		  delete :destroy, id: media.id
  		expect(subject).to redirect_to "/#{medias}"
		end
	end
end