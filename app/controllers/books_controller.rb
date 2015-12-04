class BooksController < ApplicationController
  include SharedMethods
  before_action :get_book, only:[:show, :destroy, :update, :edit, :upvote]
  def index
    @books = Book.all.order(:upvotes).reverse
  end

  def new
    @book = Book.new
  end

  def destroy
    @book.destroy
    redirect_to books_path
  end

  def update
    @book.update(book_params[:book]) ? (redirect_to book_path(@book)) : (render :edit)
  end

  def create
    book = Book.create(book_params[:book])
    if book.save
      redirect_to book_path(book)
    else
      @book = book
      render :new
    end
  end

  def upvote
    @book.upvotes += 1
    @book.save
    redirect_to book_path(@book)
  end

  private
  def get_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.permit(book:[:id, :title, :creator, :description, :upvotes])
  end
end
