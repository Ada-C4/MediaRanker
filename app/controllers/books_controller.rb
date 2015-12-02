class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    id = params[:id]
    book = Book.find(id)
    book.update_attributes(book_params)
    redirect_to book_path(params[:id])
  end

  def destroy
    Book.destroy(params[:id])
    redirect_to books_path
  end

  def upvote
    id = params[:id]
    @book = Book.find(id)
    @book.rank += 1
    @book.save
    render "show"
  end

  private

  def book_params
    params.require(:book).permit(:name, :author, :description, :rank)
  end
end
