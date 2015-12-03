require 'rails_helper'

RSpec.describe BooksController, type: :controller do

  before(:each) do
    @book = Book.create(title: "Harry Potter and the Sorcer's Stone", author: "J.K.Rolling", description: "The story of the boy who lived")
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
     get :edit, id: @book.id
     expect(response.status).to eq 200
   end
 end

  describe "GET 'show'" do
   it "is successful" do
     get :show, id: @book.id
     expect(response.status).to eq 200
   end
 end

  describe "PUT 'update'" do
   it "is successful" do
     put :update, id: @book.id
     expect(response.status).to eq 302
   end
 end

  describe "DELETE 'destroy'" do
   it "is successful" do
     delete :destroy, id: @book.id
     expect(response.status).to eq 302
   end
 end

end
