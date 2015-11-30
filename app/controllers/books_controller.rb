class BooksController < ApplicationController
  def sort(data)
    d = data.sort_by { |instance| instance.ranking }
    d.reverse
  end

  def index
    @books = sort(Book.all)
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(strong_params)
    if @book.save
      redirect_to movie_path(@book.id)
    else
      render "new"
    end
  end

  private

  def strong_params
    params.require(:book).permit(:name, :author, :description, :ranking)
  end
end
