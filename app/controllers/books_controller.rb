class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.create(book_params)
    if @book.save
      redirect_to book_path(@book.id)
    else
      render "new"
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update_attributes(book_params)
    redirect_to book_path(params[:id])
  end

end

#############PRIVATE###########
private

def book_params
  params.require(:book).permit(:name, :author, :description)
end
