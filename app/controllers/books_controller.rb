class BooksController < ApplicationController
  def index
    @books = Book.order(upvotes: :desc)
  end

  def show
    id = params[:id]
    @book = Book.find(id)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.create(book_params[:book])
    if @book.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def edit
    id = params[:id]
    @book = Book.find(id)
  end

  def update
    id = params[:id]
    @book = Book.find(id)
    @book.update(
    name: book_params[:book][:name],
    author: book_params[:book][:author],
    description: book_params[:book][:description]
    )
    redirect_to "/books/#{id}"
  end

  def destroy
    id = params[:id]
    Book.destroy(id)
    redirect_to "/books/"
  end

  def upvote
    id = params[:id]
    @book = Book.find(id)
    current_score = Book.find(id).upvotes
    if current_score.nil?
      new_score = 1
    else
      new_score = current_score + 1
    end
    @book.update(
    upvotes: new_score
    )
    redirect_to "/books/#{id}"
  end

  private

  def book_params
    params.permit(book:[:name, :author, :description, :upvotes])
  end
end
