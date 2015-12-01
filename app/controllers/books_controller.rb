class BooksController < ApplicationController
  def index
    books = Book.all

    @media = books.order(votes: :desc) if params[:order].nil?

    @media = books.order(votes: :asc) if params[:order] == 'asc'
    @media = books.order(votes: :desc) if params[:order] == 'desc'

  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params[:book])

    if @book.save
      redirect_to book_path(@book)
    else
      render :new
    end

  end

  def show
    @art = Book.find(params[:id])
    @art_attribute = @art.author
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.attributes = book_params[:book]

    if @book.save
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy

    redirect_to books_path
  end

  def upvote
    book = Book.find(params[:id])
    book.increment!(:votes)

    redirect_to :back
  end


  private

  def book_params
    params.permit(book:[:title, :author, :description])
  end
end
