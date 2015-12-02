require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  describe "GET 'index'" do
    it "is successful" do
      get :index
      expect(response.status).to eq 200
    end
  end

  describe "GET 'show'" do
    let(:album) do
      Album.create(name: "Some album")
    end

    it "renders the show view" do
      get :show, id: album.id
      expect(subject).to render_template :show
    end
  end

  describe "GET 'edit'" do
    let(:album) do
      Album.create(name: "Some album")
    end

    it "renders the edit view" do
      get :edit, id: album.id
      expect(subject).to render_template :edit
    end
  end

end
