require 'rails_helper'

RSpec.shared_examples "a medium controller" do
  describe "GET 'index'" do
    it "is successful" do
      get :index
      expect(response.status).to eq 200
    end
  end

  describe "GET 'show/:id'" do
    it "renders show view" do
      medium = model.create(name:"name")
      get :show, id: medium.id
      expect(response).to render_template(:show)
    end
  end

  describe "GET 'new'" do
    it "is successful" do
      get :new
      expect(response).to be_success
    end
  end

  describe "GET 'edit'" do
    it "is successful" do
      medium = model.create(name:"name")
      get :edit, id: medium.id
      expect(response.status).to eq 200
    end
  end

  describe "POST 'create'" do
    let(:good_params) do
      {
        model.name.downcase.to_sym => {
          id: 1,
          name: "name"
        }
      }
    end

    let(:bad_params) do
      {
        model.name.downcase.to_sym => {
          name: nil
        }
      }
    end

    it "redirects to show page" do
      post :create, good_params
      #Success case to show page
      expect(subject).to redirect_to("/#{model.name.downcase}s/1")
    end

    it "renders new template on error" do
      # Error case to show errors on form
      post :create, bad_params
      expect(subject).to render_template :new
    end
  end

  describe "PATCH 'update'" do
    before :each do
      model.create(name: "name")
    end

    let(:good_params) do
      {
        model.name.downcase.to_sym => {
            name: "name"
          },
          id: model.last.id
      }
    end

    let(:bad_params) do
      {
          model.name.downcase.to_sym => {
            name: nil
          },
          id: model.last.id
      }
    end

    it "redirects to show page" do
      patch :update, good_params
      expect(subject).to redirect_to("/#{model.name.downcase}s/#{model.last.id}")
    end

    it "renders edit template on error" do
      patch :update, bad_params
      expect(subject).to render_template :edit
    end
  end

  describe "DELETE 'destroy'" do
    let(:medium) do
      model.create(name: "name")
    end

    it "redirects to index page" do
      delete :destroy, id: medium.id
      expect(subject).to redirect_to("/#{model.name.downcase}s")
    end
  end

  describe "POST 'upvote'" do
    let(:medium) do
      model.create(name: "name", upvotes: 0)
    end

    it "incremements book upvotes by 1" do
      post :upvote, id: medium.id
      medium.reload
      expect(medium.upvotes).to eq 1
    end
  end

end
