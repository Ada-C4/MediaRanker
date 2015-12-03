class BooksController < ApplicationController
  def index
    @model = Book.all
    @path = new_book_path
    @add_button = "Add New Book"
  end

  def show
    @media = Book.find(params[:id])
    @path = upvote_book_path(@media)
  end

  def new
    @model = Book.new
    @action = "create"
    @method = :post
    @title = "New Book"
    @artist_type = "Author"
  end

  def create
    Book.create(book_params)
    redirect_to books_path
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def upvote
    @media = Book.find(params[:id])
    @media.increment!(:votes)
    redirect_to book_path(@media)
  end

private
  def book_params
    #this makes strong params
    params.require(:book).permit(:title, :artist, :description, :votes)
  end
end
