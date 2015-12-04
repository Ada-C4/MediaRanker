require 'rails_helper'

RSpec.describe MediaController, type: :controller do

  describe "GET #index" do
    it "renders the index view" do
      get :index
      expect(subject).to render_template :index
    end
  end

  describe "GET #show" do
    it "renders the show view" do
      get :show
      expect(subject).to render_template :show
    end
  end

  describe "GET #new" do
    it "renders the new view" do
      get :new
      expect(subject).to render_template :new
    end
  end

end
