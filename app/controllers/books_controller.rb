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
  end

  def update
  	@media.update(book_params)
  	redirect_to book_path(@media)
  end

  def upvote
  	@media.votes += 1
  	@media.save
  	redirect_to :back
  end

  def index
  	@media = Book.order(votes: :desc)
  end

  def show
  end

  def destroy
  	@media.destroy
  	redirect_to books_path
  end

  private 

  def book_params
  	return params.require(:books).permit(:name, :description, :author)
  end

  def set_book
  	@media = Book.find(params[:id])
  end

end
