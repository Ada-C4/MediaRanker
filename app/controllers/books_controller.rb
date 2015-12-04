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
    if @book.save
      redirect_to book_path(@book.id)
    else
      render "new"
    end
  end

  def edit
    id = params[:id]
    @book = Book.find(id)
  end

  def update
    id = params[:id]
    @book = Book.find(id)
    if @book.update(book_params[:book])
      redirect_to book_path(@book.id)
    else
      render "edit"
    end
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
