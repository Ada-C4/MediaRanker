class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def upvote
    @book = Book.find(params[:id])
    @book.update_attribute(:ranking, @book.ranking + 1)
    redirect_to action: :show
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.create(title: book_params[:book][:title],
                 description: book_params[:book][:description],
                 author: book_params[:book][:author],
                 ranking: 0)
    redirect_to book_path(@book.id)
  end

  def edit
  end

  def update
  end

  def destroy
    id = params[:id]
    Book.destroy(id)
    redirect_to books_path
  end


  private

  def book_params
    params.permit(book:[:title, :description, :ranking, :author])
  end
end
