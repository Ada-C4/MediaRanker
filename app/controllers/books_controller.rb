class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def upvote
    @book = Book.find(params[:id])
    @book.update_attribute(:ranking, @book.ranking + 1)
    redirect_to action: :show
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
  end
  def create
  end

  def edit
  end

  def update
  end

  def destroy
    id = params[:id]
    Book.destroy(id)
    redirect_to books_path
  end

  def new
  end

  private

  def book_params
    params.permit(book:[:title, :description, :ranking, :author])
  end
end
