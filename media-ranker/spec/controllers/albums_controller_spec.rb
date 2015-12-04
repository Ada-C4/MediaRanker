require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do

  before(:each) do
    @ablum = Album.create(title: "Lady in Satin", artist: "Billie Holiday", description: "I get along without you very well...")
  end

  describe "GET 'index'" do
   it "is successful" do
     get :index
     expect(response.status).to eq 200
   end
 end

  describe "POST 'create'" do
   it "successfuly redirects" do
     post :create
     expect(response.status).to eq 302
   end
 end

  describe "GET 'new'" do
   it "is successful" do
     get :new
     expect(response.status).to eq 200
   end
 end

  describe "GET 'edit'" do
   it "is successful" do
     get :edit, id: @ablum.id
     expect(response.status).to eq 200
   end
 end

  describe "GET 'show'" do
   it "is successful" do
     get :show, id: @ablum.id
     expect(response.status).to eq 200
   end
 end

  describe "PUT 'update'" do
   it "successfuly redirects" do
     put :update, id: @ablum.id
     expect(response.status).to eq 302
   end
 end

  describe "DELETE 'destroy'" do
   it "successfuly redirects" do
     delete :destroy, id: @ablum.id
     expect(response.status).to eq 302
   end
 end

end
