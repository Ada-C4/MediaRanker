class BooksController < ApplicationController
  before_action only: [:show, :edit, :update, :upvote] { @book = Book.find(params[:id])}

  def index
    @books = Book.all
  end

  def show
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
  end

  def update
    @book.update(book_params[:book])
    if @book.save
      redirect_to book_path(@book)
    else
      render "new"
    end
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
    params.permit(book: [:name, :author, :description, :rank])
  end
end
