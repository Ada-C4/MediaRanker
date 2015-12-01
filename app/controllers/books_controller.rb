class BooksController < ApplicationController
  def index
    @items = Book.order(votes: :desc)
    @type = "Book"

    render "index"
  end

  def show
    @item = Book.find(params[:id])
    @type = "Books"
    @special = "Written"


    render "show"
  end

  def upvote
    Book.find(params[:id]).increment!(:votes)

    redirect_to :back
  end

  def new
    @item = Book.new
    @special = "Author"

    render "form"
  end

  def create
    @item = Book.new(book_params)

    if @item.save
      redirect_to books_path
    else
      render "new"
    end
  end

  def edit
    @item = Book.find(params[:id])
    @special = "Author"

    render "new"
  end

  def update
    @item = Book.find(params[:id])
    @item.attributes = book_params

    if @item.save
      redirect_to books_path
    else
      render "new"
    end
  end

  def destroy
    Book.destroy(Book.find(params[:id]))

    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:name, :creator, :description)
  end
end
