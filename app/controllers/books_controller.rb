class BooksController < ApplicationController

 def index
   @books = Book.all
 end

 def show

 end

 def new

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
