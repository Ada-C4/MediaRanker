class BooksController < ApplicationController

  def index
    @books = Book.order(rank: :desc)
  end

  def create
    book = Book.create(book_params)
    book.update_attribute(:rank, 1)
    redirect_to books_path
  end

  def new
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def show
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to books_path
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def upvote
    book = Book.find(params[:id])
    rank = book.rank + 1
    book.update_attribute(:rank, rank)
    redirect_to(:back)
  end

private

  def book_params
    params.require(:book).permit(:title, :author, :description)
    end

end
