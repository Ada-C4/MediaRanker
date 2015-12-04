require 'rails_helper'

RSpec.shared_examples "media" do

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
      get :show, id: good_art.id
      expect(subject).to render_template :show
    end
  end

  describe "GET 'edit'" do
    it "renders the edit view" do
      get :edit, id: good_art.id
      expect(subject).to render_template :edit
    end
  end

  describe "POST 'create'" do
    it "redirects to show view" do
      post :create, good_params
      expect(subject).to redirect_to polymorphic_path(model.all.last)
    end

    it "renders new template on error" do
      post :create, bad_params
      expect(subject).to render_template :new
    end
  end

  describe "DELETE 'destroy'" do
    it "redirects to index view" do
      delete :destroy, id: good_art.id
      expect(subject).to redirect_to polymorphic_path(model)
    end
  end

  describe "PATCH 'update'" do
    it "redirects to show view" do
      patch :update, good_edit_params
      expect(subject).to redirect_to polymorphic_path(good_art)
    end

    it "renders edit template on error" do
      patch :update, bad_edit_params
      expect(subject).to render_template :edit
    end
  end

  describe "PATCH 'upvote'" do
    before(:each) do
      request.env["HTTP_REFERER"] = "where_i_came_from"
    end

    it "refreshes the page" do
      patch :upvote, id: good_art.id
      expect(subject).to redirect_to "where_i_came_from"
    end
  end





end
