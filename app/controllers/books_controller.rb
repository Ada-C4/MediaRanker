class BooksController < ApplicationController

  def get_book
    @book = Book.find(params[:book_id])
  end

  def index
  end

  def new
  end

  def show
    get_book
  end

  def update
  end

  def create
  end

  def destroy
  end

  private

  def book_params
    params.permit(:book[:name, :author, :description])
  end

end
