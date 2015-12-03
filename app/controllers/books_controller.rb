class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.create(book_params)
    @book.update(:rank => 0)
    if @book.save
      redirect_to book_path(@book.id)
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
    book = Book.find(params[:id])
    book.update_attributes(book_params)
    redirect_to book_path(params[:id])
  end

  def destroy
    Book.destroy(params[:id])
    redirect_to books_path
  end

  def upvote
    book = Book.find(params[:id])
    rank = book.rank
    rank += 1
    book.update(rank: rank)
    redirect_to :back
  end


#############PRIVATE###########
  private

  def book_params
    params.require(:book).permit(:name, :author, :description)
  end
end
