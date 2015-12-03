require 'rails_helper'

RSpec.describe MoviesController, type: :controller do

  before(:each) do
    @movie = Movie.create(title: "Alien", director: "Ridley Scott", description: "Here kitty, kitty, kitty!")
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
     get :edit, id: @movie.id
     expect(response.status).to eq 200
   end
 end

  describe "GET 'show'" do
   it "is successful" do
     get :show, id: @movie.id
     expect(response.status).to eq 200
   end
 end

  describe "PUT 'update'" do
   it "is successful" do
     put :update, id: @movie.id
     expect(response.status).to eq 302
   end
 end

  describe "DELETE 'destroy'" do
   it "is successful" do
     delete :destroy, id: @movie.id
     expect(response.status).to eq 302
   end
 end


end
