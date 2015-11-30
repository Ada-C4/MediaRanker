class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    id = params[:id]
    @book = Book.find(id)
  end

  def new
    @book = Book.new
  end

  def create
    id = params[:id]
    Book.create(book_params[:book])
    redirect_to "/books/#{id}"
  end

  def edit
    id = params[:id]
    @book = Book.find(id)
  end

  def update
    id = params[:id]
    @book = Book.find(id)
    @book.update(
    name: book_params[:book][:name],
    author: book_params[:book][:author],
    description: book_params[:book][:description]
    )
    redirect_to "/books/#{id}"
  end

  private

  def book_params
    params.permit(book:[:name, :author, :description, :upvotes])
  end
end
