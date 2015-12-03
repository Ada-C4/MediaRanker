require 'rails_helper'

RSpec.shared_examples "media" do

  describe "GET 'index'" do
    it "is successful" do
      get :index
      expect(response.status).to eq 200
    end
  end

  describe "GET 'new'" do
    it "renders new view" do
      get :new
      expect(subject).to render_template :new
    end
  end

  # describe "POST 'create'" do
  #   it "redirects to show view" do
  #     post :create, good_params
  #     expect(subject).to redirect_to polymorphic_path(id: good_art.id)
  #   end
  #
  #   it "renders new template on error" do
  #     post :create, bad_params
  #     expect(subject).to render_template :new
  #   end
  # end

  describe "GET 'edit'" do
    it "renders the edit view" do
      get :edit, id: good_art.id
      expect(subject).to render_template :edit
    end
  end

end
