class BooksController < ApplicationController
  def sort(data)
    d = data.sort_by { |instance| instance.ranking }
    d.reverse
  end

  def index
    @media = sort(Book.all)
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
      redirect_to book_path(@book.id)
    else
      render "new"
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.attributes = strong_params
    if @book.save
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
    @book = Book.find(params[:id])
    @book.ranking += 1
    @book.save
    render "show"
  end

  private

  def strong_params
    params.require(:book).permit(:name, :author, :description, :ranking)
  end
end
