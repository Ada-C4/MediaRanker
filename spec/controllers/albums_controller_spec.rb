require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  describe "GET 'index'" do
    it "is successful" do
      get :index
      expect(response).to have_http_status 200
    end
  end

  describe "GET 'new'" do
    it "renders new view" do
      get :new
      expect(subject).to render_template :new
    end
  end

  describe "GET 'edit'" do
    let (:edit_album) do
      Album.create(title:"a", artist: "b", description: "c", ranking: 0 )
    end

    it "renders edit view" do
      get :edit, id: edit_album.id
      expect(subject).to render_template :edit
    end
  end


  describe "GET 'show'" do
    let(:show_album) do
      Album.create(title:"a", artist: "b", description: "c", ranking: 0 )
    end

    it "renders the show view" do
      get :show, id: show_album.id
      expect(subject).to render_template :show
    end
  end


  describe 'upvote' do

  end

  # describe "POST 'create'" do
  #   let(:good_params) do
  #   {
  #     post: {
  #       body: "Something something something"
  #     }
  #   }
  #   end
  #
  #   let (:bad_params) do
  #     {
  #       post: {}
  #     }
  #   end
  #
  #   it "redirects to index page" do
  #     post :create, good_params
  #
  #     # Success case to index page
  #     expect(subject).to redirect_to posts_path
  #   end
  #
  #   it "renders new template on error" do
  #     # Error case to show errors on form
  #     post :create, bad_params
  #     expect(subject).to render_template :new
  #   end
  # end
end
