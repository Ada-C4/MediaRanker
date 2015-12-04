require 'rails_helper'

include Rails.application.routes.url_helpers

RSpec.shared_examples "a medium controller" do

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

  describe "POST 'create'" do
    before :each do
      post :create, good_params
    end

    it "redirects to show page" do
      expect(subject).to redirect_to polymorphic_path(assigns(media_type))
    end

    it "renders new template on error" do
      post :create, bad_params
      expect(subject).to render_template :new
    end
  end

  describe "GET 'show'" do
    it "renders the show view" do
      get :show, id: test_medium.id
      expect(subject).to render_template :show
    end
  end

  describe "GET 'edit'" do
    it "renders edit view" do
      get :edit, id: test_medium.id
      expect(subject).to render_template :edit
    end
  end

  describe "PATCH 'update'" do
    before :each do
      patch :update, good_update_params
    end

    it "redirects to show page" do
      expect(subject).to redirect_to polymorphic_path(assigns(media_type))
    end

    it "updates the item" do
      test_medium.reload
      expect(test_medium.name).to eq("New name")
    end

    it "renders edit template on error" do
      patch :update, bad_update_params
      expect(subject).to render_template :edit
    end

    it "does not change the item if params are bad" do
      patch :update, bad_update_params
      expect(test_medium.name).not_to eql("New name")
    end
  end

  describe "DELETE 'destroy'" do
    before :each do
      delete :destroy, id: test_medium.id
    end
    it "redirects to the index view" do
      expect(subject).to redirect_to polymorphic_path(media_type_plural)
    end
  end

  describe "PATCH 'upvote'" do

    let(:upvote_params) do {
        id: test_medium.id
      }
    end

    before :each do
      patch :upvote, upvote_params
    end

    it "redirects to show page" do
      expect(subject).to redirect_to polymorphic_path(test_medium)
    end

    it "increases the rank value by 1" do
      test_medium.reload
      expect(test_medium.rank).to eq 1
    end
  end
end
