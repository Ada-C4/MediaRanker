require 'rails_helper'

RSpec.shared_examples "media_controller" do |subject_class|
  # :nocov:
  describe "#upvote" do
    before :each do
      request.env["HTTP_REFERER"] = "from_whence_we_came"
    end
    it "increments :votes" do
      patch :upvote, id: item.id
      item.reload
      expect(item.votes).to eq 23
      expect(subject).to redirect_to "from_whence_we_came"
    end
  end

  describe "GET 'index'" do
    before :each do
      get :index
    end
    it "is successful" do
      expect(response.status).to eq 200
    end
    it "renders :form" do
      expect(subject).to render_template :index
    end
  end

  describe "GET 'show'" do
    before :each do
      get :show, id: item.id
    end
    it "is successful" do
      expect(response.status).to eq 200
    end
    it "renders :form" do
      expect(subject).to render_template :show
    end
  end

  describe "GET 'new'" do
    before :each do
      get :new
    end
    it "is successful" do
      expect(response.status).to eq 200
    end
    it "renders :form" do
      expect(subject).to render_template :form
    end
  end

  describe "GET 'edit'" do
    before :each do
      get :edit, id: item.id
    end
    it "is successful" do
      expect(response.status).to eq 200
    end
    it "renders :form" do
      expect(subject).to render_template :form
    end
  end

  describe "POST 'create'" do
    it "redirects to show page" do
      post :create, params
      expect(subject).to redirect_to polymorphic_path(subject_class.last)
    end
    it "renders new template on error" do
      post :create, bad_params
      expect(subject).to render_template :form
    end
  end

  describe "PATCH 'update'" do
    it "redirects to show page" do
      patch :update, params.merge({id: item.id})
      expect(subject).to redirect_to polymorphic_path(item)
    end
    it "renders new template on error" do
      patch :update, bad_params.merge({id: item.id})
      expect(subject).to render_template :form
    end
  end

  describe "DELETE 'destroy'" do
    it "redirects to index page" do
      delete :destroy, params.merge({id: item.id})
      expect(subject).to redirect_to polymorphic_path(subject_class)
    end
  end
  # :nocov:
end
