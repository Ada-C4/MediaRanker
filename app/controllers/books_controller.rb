class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @books = Book.find(params[:id])
  end

  def new
    @books = Book.new
  end

  def create
    @books = Book.create(book_params[:book])
    if @books.save
      redirect_to book_path(@books.id)
    else
      render "new"
    end
  end

  def edit
    @books = Book.find(params[:id])
  end

  def update
    @books = Book.find(params[:id])
    book.update(params[:id], book_params[:book])
    redirect_to book_path(params[:id])
  end

  def destroy
    Book.destroy(params[:id])
    redirect_to books_path
  end

  def upvote
    @books = Book.find(params[:id])
    @books.rank += 1
    @books.save
    redirect_to book_path(@books.id)
  end

  private

  def book_params
    params.permit(movie: [:name, :author, :description])
  end
end
