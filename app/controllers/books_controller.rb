class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.create(book_params[:book])
    if @book.save
      redirect_to book_path(@book.id)
    else
      render "new"
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    book.update(params[:id], book_params[:book])
    redirect_to book_path(params[:id])
  end

  def destroy
    Book.destroy(params[:id])
    redirect_to books_path
  end

  def upvote
    @book = Book.find(params[:id])
    @book.rank += 1
    @book.save
    redirect_to book_path(@book.id)
  end

  private

  def book_params
    params.permit(movie: [:name, :author, :description])
  end
end
