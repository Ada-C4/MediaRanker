RSpec.shared_examples "a medium controller" do
  describe "GET 'index'" do
    it "is successful" do
      get :index
      expect(response.status).to eq 200
    end
  end

  describe "GET 'show'" do
    it "renders the show view" do
      medium = model.create(name: "Test")
      get :show, id: medium.id
      expect(subject).to render_template :show
    end
  end

  describe "GET 'new'" do
    it "renders new view" do
      get :new
      expect(subject).to render_template :new
    end
  end

  describe "POST 'create'" do

    it "redirects to show page" do
      post :create, good_params
      expect(subject).to redirect_to polymorphic_path(model.all.last)
    end

    it "renders new template on error" do
      post :create, bad_params
      expect(subject).to render_template :new
    end
  end

  describe "GET 'edit'" do
    it "renders edit view" do
      medium = model.create(name: "Test")
      get :edit, id: medium.id
      expect(subject).to render_template :edit
    end
  end

  describe "PATCH 'update'" do
    let (:medium) do
      model.create(name: "Test")
    end

    it "redirects to show page" do
      patch :update, good_params.merge({id: medium.id})
      expect(subject).to redirect_to polymorphic_path(medium)
      expect(model.all.last.name).to eq "zzzTest"
    end

    it "renders edit template on error" do
      patch :update, bad_params.merge({id: medium.id})
      expect(subject).to render_template :edit
      expect(model.all.last.name).to eq "Test"
    end
  end

end
