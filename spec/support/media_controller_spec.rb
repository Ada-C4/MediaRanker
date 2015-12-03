require 'rails_helper'

RSpec.shared_examples "media" do
  describe "GET 'index'" do
    it "is successful" do
      get :index
      expect(response.status).to eq 200
    end
  end
end
