class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    id = params[:id]
    @book = Book.find(id)
  end

  def new
    @book = Book.new
  end

  def create
    Book.create(book_params[:book])
    redirect_to books_path
  end

  def destroy
    id = params[:id]
    Booke.delete(id)
    redirect_to books_path
  end

  def edit
    id = params[:id]
    @book = Book.find(id)
    session[:return_to] = request.referer
  end

  def update
    id = params[:id]
    book = Book.find(id)
    book.update(
    name: book_params[:book][:name],
    author: book_params[:book][:author],
    description: book_params[:book][:description],
    )
    book.save
    if session[:return_to].nil?
      redirect_to "/"
    else
      redirect_to session[:return_to]
    end
    session[:return_to] = nil
  end


  private

  def book_params
    params.permit(book:[:name, :author, :description])
  end
end
