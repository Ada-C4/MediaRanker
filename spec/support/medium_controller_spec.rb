include Rails.application.routes.url_helpers

RSpec.shared_examples "a medium controller" do

  describe "GET 'index'" do
    it "is successful" do
      get :index
      expect(response.status).to eq 200
      expect(subject).to render_template :index
    end
  end

  describe "GET 'show'" do
    it "renders the show view for a move" do
      get :show, id: medium.id
      expect(subject).to render_template :show
    end
  end

  describe "POST 'create'" do
    it "redirects to show page" do
      post :create, create_params
      expect(subject).to redirect_to show_1
     end

     it "renders new template on create error" do
       post :create, bad_params
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
    it "redirects to index view" do
    delete :destroy, id: medium.id
    expect(subject).to redirect_to polymorphic_path(medium.class)
    end
  end

  describe "PATCH 'update'" do

    it "successful update renders show view" do
        patch :update, update_params
        expect(response.status).to eq 302
        expect(subject).to redirect_to polymorphic_path(medium)
      end

    it "unsuccessful update renders edit form" do
      patch :update, bad_params
      expect(subject).to render_template :edit
    end
  end

  describe "PATCH 'upvote'" do

    it "renders show view" do
      patch :upvote, id: medium.id
      medium.reload
      expect(response.status).to eq 302
      expect(subject).to redirect_to polymorphic_path(medium)
    end

    it "increments votes" do
      patch :upvote, id: medium.id
      medium.reload
      expect(medium.rank).to eq 1
    end
  end
end
