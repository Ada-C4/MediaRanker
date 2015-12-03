RSpec.shared_examples "a medium controller" do
  describe "GET 'index'" do
    it "is successful" do
      get :index
      expect(response.status).to eq 200
      expect(subject).to render_template :index
    end
  end

  describe "GET 'new'" do
    it "is successful" do
      get :new
      expect(response.status).to eq 200
      expect(subject).to render_template :new
    end
  end

  describe "GET 'show/:id'" do
    it "renders show view" do
      get :show, id: medium.id
      expect(response.status).to eq 200
    end
  end

  describe "POST 'create'" do
    it "successful create redirects to show page" do
      post :create, good_params
      expect(response.status).to eq 302
      expect(subject).to redirect_to polymorphic_path(model.all.last)
    end

    it "unsuccessful create renders new page" do
      post :create, bad_params
      expect(response.status).to eq 200
      expect(subject).to render_template :new
    end
  end

  describe "GET 'edit'" do
    it "renders edit view" do
      get :edit, id: medium.id
      expect(response.status).to eq 200
    end
  end

  describe "DELETE 'destroy'" do
    it "redirects to show view" do
      delete :destroy, id: medium.id
      expect(response.status).to eq 302
      expect(subject).to redirect_to polymorphic_path(model)
    end
  end

  describe "PATCH 'update'" do
    it "successful update renders show view" do
      model.create(good_params[:"#{model_name}"])
      patch :update, good_params
      expect(response.status).to eq 200
      expect(subject).to render_template :show
    end

    it "unsuccessful update renders new view" do
      model.create(good_params[:"#{model_name}"])
      patch :update, bad_params
      expect(response.status).to eq 200
      expect(subject).to render_template :edit
    end
  end

  describe "PATCH 'upvote'" do
    it "renders show view" do
      model.create(good_params[:"#{model_name}"])
      patch :upvote, good_params
      expect(response.status).to eq 200
      expect(subject).to render_template :show
    end
  end

end
