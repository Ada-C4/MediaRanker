require 'rails_helper'

RSpec.describe HomepageController, type: :controller do
  describe "GET 'home'" do
    it "renders the home template" do
      # Error case to show errors on form
      get :home
      expect(subject).to render_template :home
    end
  end
end
