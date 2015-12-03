require 'rails_helper'


RSpec.shared_examples "a medium controller" do
  Rails.application.routes.url_helpers
  describe "GET 'index'" do
    it "is successful" do
      get :index
      expect(response.status).to eq 200
    end
  end

  describe "GET 'new'" do
    it "renders new view" do
      get :new
      expect(subject).to render_template :new
    end
  end

  describe "GET 'show'" do
    it "renders the show view" do
      get :show, id: medium.id
      expect(subject).to render_template :show
    end
  end

  describe "POST 'create'" do
    # let(:good_params) do
    # {
    #   medium: {
    #     name: "Something something something"
    #   }
    # }
    # end

    let (:bad_params) do
      {
        medium: {}
      }
    end

    it "redirects to index page" do

      post :create, good_params
      new_medium = model.last

      # Success case to index page
      expect(subject).to redirect_to book_path(new_medium.id) #FIX PATH
    end

    it "renders new template on error" do
      # Error case to show errors on form
      post :create, bad_params
      expect(subject).to render_template :new
    end
  end

  describe "GET 'edit'" do
    it "renders the edit view" do
      get :edit, id: medium.id
      expect(subject).to render_template :edit
    end
  end

  # describe "PATCH 'update'" do
  #   it "redirects to show page" do
  #     # book = Book.create(name: "Something", author: "Someone", description: "Something something something")
  #     # params =   {
  #     #   book: {
  #     #     name: "Something",
  #     #     author: "Someone",
  #     #     description: "Something something something"
  #     #   },
  #     #   id: book.id
  #     # }
  #
  #     patch :update, params
  #     binding.pry
  #     expect(subject).to redirect_to book_path(medium.id)
  #   end
  # end

end
