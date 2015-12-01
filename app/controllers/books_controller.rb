class BooksController < ApplicationController

  def get_book
    @book = Book.find(params[:id])
  end

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def edit
    get_book
  end

  def show
    get_book
  end

  def update
    if params[:class] == "upvote"
      get_book
      rank = @book[:rank] + 1
      @book.update(:rank => rank)
      render "show"
    else
      get_book
      @book.update(book_params[:book])
      redirect_to book_path
    end
  end

  def create
    Book.create(book_params[:book])
    redirect_to books_path
  end

  def destroy
    Book.destroy(params[:id])
    redirect_to books_path
  end

  private

  def book_params
    params.permit(book: [:name, :author, :description, :rank])
  end

end
