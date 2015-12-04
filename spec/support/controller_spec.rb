require 'rails_helper'
require 'simplecov'

RSpec.shared_examples "a controller" do
  describe "GET 'index'" do
    before :each do
      get :index
    end
    it "is successful" do
      expect(response.status).to eq 200
    end
    it "renders :index" do
      expect(subject).to render_template :index
    end
  end

  describe "GET 'new'" do
    before :each do
      get :new
    end
    it "is successful" do
      expect(response.status).to eq 200
    end
    it "renders :new" do
      expect(subject).to render_template :new
    end
  end

  describe "GET 'show'" do
    before :each do
      get :show, id: medium.id
    end
    it "is successful" do
      expect(response.status).to eq 200
    end
    it "renders :show" do
      expect(subject).to render_template :show
    end
  end

  describe "GET 'edit'" do
    before :each do
      get :edit, id: medium.id
    end
    it "is successful" do
      expect(response.status).to eq 200
    end
    it "renders :edit" do
      expect(subject).to render_template :new
    end
  end

  describe "POST 'upvote'" do
    before :each do
      get :upvote, id: medium.id
    end
    it "is successful" do
      expect(response.status).to eq 302
    end
    it "redirect_to :show" do
      expect(subject).to redirect_to :show
    end
  end

  describe "DELETE 'destroy'" do
    before :each do
      delete :destroy, id: medium.id
    end
    it "is successful" do
      expect(response.status).to eq 302
    end
  end

  describe "POST 'create'" do
    before :each do
      post :create, id: medium.id
    end
    it "is successful" do
      expect(response.status).to eq 302
    end
    it "redirect_to :index" do
      expect(subject).to redirect_to :index
    end
  end
end
