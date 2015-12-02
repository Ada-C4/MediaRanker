class BooksController < ApplicationController
  before_action :get_book, only: [:show, :edit, :destroy, :upvote, :update]

  def get_book
    @book = Book.find(params[:id])
  end

  def index
    @books = Book.order(ranked: :desc)
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.create(book_params)
    if @book.save
      redirect_to book_path(@book)
    else
      render "new"
    end
  end

  def edit
  end

  def update
    @book.update(book_params)
    if @book.save
      redirect_to book_path(@book)
    else
      render "edit"
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path
  end

  def upvote
    @book.ranked += 1
    @book.save
    redirect_to book_path(@book)
  end

  private

  def book_params
    params.require(:book).permit([:name, :author, :description])
  end
end
