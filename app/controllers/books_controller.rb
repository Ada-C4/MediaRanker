class BooksController < ApplicationController
  before_action :set_book, only: [:edit, :show, :update, :destroy, :upvote] 

  def new
  	@media = Book.new
  end

  def create
  	@book = Book.new(book_params)
  	@book.votes = 0
  	if @book.save
  		redirect_to book_path(@book)
  	else
  		render 'new'
  	end
  end

  def edit
  	@media = @book
  end

  def update
  	@book.update(book_params)
  	redirect_to book_path(@book)
  end

  def upvote
  	@book.votes += 1
  	@book.save
  	redirect_to :back
  end

  def index
  	@media = Book.order(votes: :desc)
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
  	@book = Book.find(params[:id])
  end

end
