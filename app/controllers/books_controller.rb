class BooksController < ApplicationController

  def index
    @books = Book.all.sort_by { |book| -book.rank }
  end

  def upvote
    book = Book.find(params[:id])
    book.rank += 1
    book.save
    redirect_to book_path(book)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book)
    else
      render "new"
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update( book_params )
    if @book.save
      redirect_to book_path(@book)
    else
      render "edit"
    end
  end

  def destroy
    Book.destroy(params[:id])
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:name, :author, :description, :rank)
  end


end
