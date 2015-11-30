class BooksController < ApplicationController
  before_action :set_book, only: [:edit, :show, :update, :destroy] 

  def new
  	@book = Book.new
  end

  def create
  	@book = Book.new(book_params)
  	if @book.save
  		redirect_to book_path(@book)
  	else
  		render 'new'
  	end
  end

  def edit
  end

  def update
  	@book.update(book_params)
  	redirect_to book_path(@book)
  end

  def index
  	@books = Book.all
  end

  def show
  end

  def destroy
  	@book.destroy
  	redirect_to books_path
  end

  private 

  def book_params
  	return params.require(:books).permit(:name, :description, :author)
  end

  def set_book
  	@book = Book.find(params:id)
  end

end
