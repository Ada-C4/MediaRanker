class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def new
    @url = "create"
    @book = Book.new
  end

  def create
    @book = Book.create(book_params[:book])
    redirect_to "/books"
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @legend = "Edit Book"
  end

  def update
    Book.update(params[:id], book_params[:book])
    redirect_to "/books/#{@book.id}"
  end

  def destroy
    Book.destroy(params[:id])
    redirect_to books_path
  end

  def upvote
    @book = Book.find(params[:id])
    @book.rank += 1
    @book.save
    render "show"
  end

private

  def book_params
    params.permit(book: [:name, :author, :description, :rank])
  end

end
