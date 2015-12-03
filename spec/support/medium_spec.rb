require 'rails_helper'
require 'pry'

RSpec.shared_examples "a medium" do
  describe "controller validations" do
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
      it "renders edit view" do
        get :edit, id: item.id
        expect(subject).to render_template :edit
      end
    end


    describe "GET 'show'" do
      it "renders the show view" do
        get :show, id: item.id
        expect(subject).to render_template :show
      end
    end

    describe "PATCH 'upvote'" do
     it "increments ranking" do
       patch :upvote, id: item.id
       item.reload
       expect(item.ranking).to eq 1
     end
     it "redirects to show" do
       patch :upvote, id: item.id
       expect(subject).to redirect_to(:action => "show", :id => item.id )
     end
    end


    describe "POST 'create'" do
      it "redirects to show page for created medium" do
        post :create, good_params
        new_item = model.last
        expect(subject).to redirect_to(:action => "show", :id => new_item.id )
      end

      it "renders new template on error" do
        post :create, bad_params
        expect(subject).to render_template :new
      end
    end

    # describe "POST 'update'" do
    #   let(:update_album) do
    #     Album.create!(title:"a", artist: "b", description: "c", ranking: 0 )
    #   end
    #
    #   let(:good_update_params) do
    #   {
    #     id: update_album.id,
    #     album: {
    #       title: "a title",
    #       ranking: 0
    #     }
    #   }
    #   end
    #
    #   let (:bad_update_params) do
    #     {
    #       id: update_album.id,
    #       album: {
    #         title: nil,
    #         description: "a description",
    #         ranking: 0
    #       }
    #     }
    #   end
    #
    #   it "redirects to show page for edited album" do
    #     post :update, good_update_params
    #     expect(subject).to redirect_to album_path(update_album.id)
    #   end
    #
    #   it "renders edit form on error" do
    #     post :update, bad_update_params
    #     expect(subject).to render_template "edit"
    #   end
    # end
    #
    # describe "DELETE 'destroy'" do
    #   let(:delete_album) do
    #     Album.create!(title:"a", artist: "b", description: "c", ranking: 0 )
    #   end
    #   it "redirects to albums index" do
    #     delete :destroy, {id: delete_album.id }
    #     expect(subject).to redirect_to albums_path
    #   end
    # end
  end
end
