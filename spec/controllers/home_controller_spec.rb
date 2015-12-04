require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  # VERB 'action'
  describe "GET 'index'" do
    it "is successful" do
      # verb :action
      get :index
      expect(response.status).to eq 200
    end
  end
end
