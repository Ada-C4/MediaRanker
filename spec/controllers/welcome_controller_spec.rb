require 'rails_helper'
require 'simplecov'

RSpec.describe WelcomeController, type: :controller do
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
end 
