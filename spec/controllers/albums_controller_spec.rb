require 'rails_helper'
require 'pry'

RSpec.describe AlbumsController, type: :controller do
  it_behaves_like "a medium"
    let(:model) { Album }
    let(:item) { Album.create!(title: "an album", ranking: 0) }


    let(:good_params) do
    {
      album: {
        title: "a title",
        ranking: 0
      }
    }
    end

    let (:bad_params) do
      {
        album: {
          description: "a description",
          ranking: 0
        }
      }
    end

#   describe "POST 'create'" do
#     let(:good_params) do
#     {
#       album: {
#         title: "a title",
#         ranking: 0
#       }
#     }
#     end
#
#     let (:bad_params) do
#       {
#         album: {
#           description: "a description",
#           ranking: 0
#         }
#       }
#     end
#
#     it "redirects to show page for created album" do
#       post :create, good_params
#       new_album = Album.last
#       expect(subject).to redirect_to album_path(new_album.id)
#     end
#
#     it "renders new template on error" do
#       post :create, bad_params
#       expect(subject).to render_template :new
#     end
#   end
#
#   describe "POST 'update'" do
#     let(:update_album) do
#       Album.create!(title:"a", artist: "b", description: "c", ranking: 0 )
#     end
#
#     let(:good_update_params) do
#     {
#       id: update_album.id,
#       album: {
#         title: "a title",
#         ranking: 0
#       }
#     }
#     end
#
#     let (:bad_update_params) do
#       {
#         id: update_album.id,
#         album: {
#           title: nil,
#           description: "a description",
#           ranking: 0
#         }
#       }
#     end
#
#     it "redirects to show page for edited album" do
#       post :update, good_update_params
#       expect(subject).to redirect_to album_path(update_album.id)
#     end
#
#     it "renders edit form on error" do
#       post :update, bad_update_params
#       expect(subject).to render_template "edit"
#     end
#   end
#
#   describe "DELETE 'destroy'" do
#     let(:delete_album) do
#       Album.create!(title:"a", artist: "b", description: "c", ranking: 0 )
#     end
#     it "redirects to albums index" do
#       delete :destroy, {id: delete_album.id }
#       expect(subject).to redirect_to albums_path
#     end
#   end
end
