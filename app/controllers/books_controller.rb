class BooksController < ApplicationController

  def index
    @books = Book.all.sort_by { |book| -book.rank }
  end

  def upvote
    b = Book.find(params[:id])
    b.rank += 1
    b.save
    redirect_to book_path(b)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params[:book])
    if @book.save
      redirect_to album_path(@book)
    else
      render "new"
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  private

  def book_params
    params.permit(book:[:name, :author, :description, :rank])
  end


end
