class BooksController < ApplicationController
  def index
    @media = Book.order(ranking: :desc)
  end

  def show
    @media = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(strong_params)
    if @book.save
      redirect_to book_path(@book.id)
    else
      render "new"
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @media = Book.find(params[:id])
    @media.attributes = strong_params
    if @media.save
      render "show"
    else
      render "new"
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def upvote
    @media = Book.find(params[:id])
    @media.ranking += 1
    @media.save
    render "show"
  end

  private

  def strong_params
    params.require(:book).permit(:name, :author, :description, :ranking)
  end
end
