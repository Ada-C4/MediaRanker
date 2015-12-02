class BooksController < ApplicationController
  def index
    @books = Book.order(ranking: :desc)
  end

  def show
    id = params[:id]
    @book = Book.find(id)
  end

  def new
    @book = Book.new
  end

  def upvote
    @book = Book.find(params[:id])
    if @book.ranking.nil?
      ranking = 1
    else
      ranking = @book.ranking + 1
    end
    @book.update(ranking: ranking)
    redirect_to book_path(@book.id)
  end

  def create
    @book = Book.create(book_params[:book])
    if @book.save
      redirect_to book_path(@book)
    else
      render "new"
    end
  end

  def destroy
    id = params[:id]
    Book.delete(id)
    redirect_to books_path
  end

  def edit
    id = params[:id]
    @book = Book.find(id)
  end

  def update
    id = params[:id]
    book = Book.find(id)
    book.update(
    name: book_params[:book][:name],
    author: book_params[:book][:author],
    description: book_params[:book][:description],
    )
    redirect_to book_path(book.id)
  end


  private

  def book_params
    params.permit(book:[:name, :author, :description])
  end
end
