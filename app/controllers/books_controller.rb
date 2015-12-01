class BooksController < ApplicationController

 def index
   @books = Book.all.order(:upvotes).reverse
 end

 def show
   @book = Book.find(params[:id])
 end

 def new
   @book = Book.new
 end

 def edit
   @book = Book.find(params[:id])
 end

 def create
   @book = Book.new(book_params)
   if @book.save
     redirect_to book_path(@book.id)
   else
     render :new
   end
 end

 def update
   Book.update(params[:id], book_params)
   redirect_to book_path(params[:id])
 end

 def destroy
  Book.find(params[:id]).destroy
  redirect_to books_path
 end

 def upvote
   book = Book.find(params[:id])
   book.upvotes += 1
   book.save!
   redirect_to book_path(params[:id])
 end

 private

  def book_params
    params.require(:book).permit(:name, :author, :description)
  end
end
