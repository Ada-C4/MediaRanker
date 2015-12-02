class BooksController < ApplicationController
  def index
    @media = Book.order(ranking: :desc)
  end

  def show
    @media = Book.find(params[:id])
  end

  def new
    @media = Book.new
  end

  def create
    @media = Book.new(strong_params)
    if @media.save
      redirect_to book_path(@media.id)
    else
      render "new"
    end
  end

  def edit
    @media = Book.find(params[:id])
  end

  def update
    @media = Book.find(params[:id])
    @media.attributes = strong_params
    if @media.save
      render "show"
    else
      render "edit"
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
