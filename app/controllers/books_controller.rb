class BooksController < ApplicationController

 def index
   @books = Book.all
 end

 def show
   id = params[:id]
   @book = Book.find(id)
 end

 def new
   @book = Book.new
 end

 def edit

 end

 def create

 end

 def update

 end

 def destroy

 end

 private

  def book_params
    params.require(:book).permit(:name, :author, :description)
  end
end
