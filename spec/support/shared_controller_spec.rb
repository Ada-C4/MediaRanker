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
      expect(subject).to redirect_to polymorphic_path(item)
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
    it "creates item with good params" do
      last_object = subject_class.last
      post :create, params.merge({type: subject_class.to_s})
      expect(subject_class.last).to_not eq last_object
    end
    it "renders new template on error" do
      post :create, bad_params.merge({type: subject_class.to_s})
      expect(subject).to render_template :form
    end
    it "does not create item with bad params" do
      last_object = subject_class.last
      post :create, bad_params.merge({type: subject_class.to_s})
      expect(subject_class.last).to eq last_object
    end
  end

  describe "PATCH 'update'" do
    it "redirects to show page" do
      patch :update, params.merge({id: item.id, type: subject_class.to_s})
      expect(subject).to redirect_to polymorphic_path(subject_class.last)
    end
    it "updates item with good params" do
      before_attributes = item.attributes
      patch :update, params.merge({id: item.id, type: subject_class.to_s})
      item.reload
      expect(item.attributes).to_not eq before_attributes
    end
    it "renders new template on error" do
      patch :update, bad_params.merge({id: item.id, type: subject_class.to_s})
      expect(subject).to render_template :form
    end
    it "does not update item with bad params" do
      before_attributes = item.attributes
      patch :update, bad_params.merge({id: item.id, type: subject_class.to_s})
      item.reload
      expect(item.attributes).to eq before_attributes
    end
  end

  describe "DELETE 'destroy'" do
    it "redirects to index page" do
      delete :destroy, params.merge({id: item.id, type: subject_class.to_s})
      expect(subject).to redirect_to polymorphic_path(subject_class)
    end
    it "deletes specified object" do
      expect(subject_class.all).to include(item)
      delete :destroy, params.merge({id: item.id, type: subject_class.to_s})
      expect(subject_class.all).to_not include(item)
    end
  end
end
