require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  it_behaves_like "a medium controller" do
    let(:model) do
      Album
    end
    let(:medium) do
      Album.create(name: "hello")
    end
    let(:good_params) do
      {
        album: {
          name: "something something"
        }
      }
    end
    let(:bad_params) do
      {
        album: {
          description: "something"
        }
      }
    end
  end

  describe "DELETE 'destroy'" do
    let(:album) do
      Album.create(name: "hello")
    end

    it "redirects to show view" do
      delete :destroy, id: album.id
      expect(response.status).to eq 302
      expect(subject).to redirect_to albums_path
    end
  end

  describe "PATCH 'update'" do
    let(:good_params) do
      {
        id: 1,
        album: {
          name: "hello"
        }
      }
    end

    let(:bad_params) do
      {
        id: 1,
        album: {
          name: nil,
          description: "world"
        }
      }
    end

    it "successful update renders show view" do
      Album.create(good_params[:album])
      patch :update, good_params
      expect(response.status).to eq 200
      expect(subject).to render_template :show
    end

    it "unsuccessful update renders new view" do
      Album.create(good_params[:album])
      patch :update, bad_params
      expect(response.status).to eq 200
      expect(subject).to render_template :edit
    end
  end

  describe "PATCH 'upvote'" do
    let(:params) do
      {
        id: 1,
        album: {
          name: "hello",
          ranking: 0
        }
      }
    end

    it "renders show view" do
      Album.create(params[:album])
      patch :upvote, params
      expect(response.status).to eq 200
      expect(subject).to render_template :show
    end
  end

end
