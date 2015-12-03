require 'rails_helper'

RSpec.shared_examples "a controller" do |subject_class|
  describe "#upvote" do
    before :each do
      request.env["HTTP_REFERER"] = "from_whence_we_came"
    end
    it "increments :votes" do
      patch :upvote, type: subject_class.to_s, id: item.id
      item.reload
      expect(item.votes).to eq 23
      expect(subject).to redirect_to "from_whence_we_came"
    end
  end

  describe "GET 'index'" do
    before :each do
      get :index, type: subject_class.to_s
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
      get :show, type: subject_class.to_s, id: item.id
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
      get :new, type: subject_class.to_s
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
      get :edit, type: subject_class.to_s, id: item.id
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
      post :create, params.merge({type: subject_class.to_s})
      expect(subject).to redirect_to polymorphic_path(subject_class.last)
    end
    it "renders new template on error" do
      post :create, bad_params.merge({type: subject_class.to_s})
      expect(subject).to render_template :form
    end
  end

  describe "PATCH 'update'" do
    it "redirects to show page" do
      patch :update, params.merge({id: item.id, type: subject_class.to_s})
      expect(subject).to redirect_to polymorphic_path(subject_class.last)
    end
    it "renders new template on error" do
      patch :update, bad_params.merge({id: item.id, type: subject_class.to_s})
      expect(subject).to render_template :form
    end
  end

  describe "DELETE 'destroy'" do
    it "redirects to index page" do
      expect(subject_class.all).to include(item)
      delete :destroy, params.merge({id: item.id, type: subject_class.to_s})
      expect(subject).to redirect_to polymorphic_path(subject_class)
      expect(subject_class.all).to_not include(item)
    end
  end
end
