class BooksController < ApplicationController

  def get_book
    id = params[:id]
    @book = Book.find(id)
  end

  def index
    @books = Book.all
    @books_sort = @books.sort_by{ |book| book[:rank] }.reverse
  end

  def show
    get_book
  end

  def new
    @book = Book.new
    @title = "Add New Book"
    @action = "create"
  end

  def create
    @book = Book.create(book_params[:book])
    @book.update(:rank => 0)
    if @book.save
      redirect_to "/books"
    else
      render "/books/new"
    end
  end

  def edit
    @book = Book.find(params[:id])
    @title = "Edit #{@book.name}"
    @action = "update"
  end

  def upvote
    @book = Book.find(params[:id])
    @book.increment!(:rank)
    redirect_to :back
  end

  def update
    @book = Book.update(params[:id], name: book_params[:book][:name])
    if @book.save
      redirect_to "/books/#{@book.id}"
    else
      render :edit
    end
  end

  def destroy
    Book.destroy(params[:id])
    redirect_to '/books'
  end

  private

  def book_params
    params.permit(book:[:name, :author, :description, :rank])
  end
end
