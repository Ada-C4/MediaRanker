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
end
