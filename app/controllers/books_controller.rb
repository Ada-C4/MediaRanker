class BooksController < ApplicationController
  def index
    @content_list = Book.order(votes: :desc)
    @item_path, @content_type = Book.page_grammer
    @new_content_path = new_book_path
  end

  def show
    @content = Book.find(params[:id])
    @edit_path = edit_book_path(params[:id])
    @content_path = books_path
    @item_path, @content_type = Book.page_grammer
    @correct_string = "Written by: "
    @person = @content.author
  end

  def new
    @item = Book.new
    @person = :author
    @action = "create"
  end

  def create
    @person = :author
    @item = Book.new(book_params)
    if @item.save
      redirect_to "/books/#{@item.id}"
    else
      render "new"
    end
  end

  def edit
    @item = Book.find(params[:id])
    @person = :author
    @action = "update"
  end

  def update
    @person = :author
    @item = Book.update(params[:id], book_params[:book])
    if @item.save
      redirect_to "/books/#{@item.id}"
    else
      render "new"
    end
  end


  def destroy
    Book.destroy(params[:id])
    redirect_to books_path
  end

  def upvote
    id = params[:id]
    book = Book.find(id)
    votes = book.votes + 1
    book.update(votes: votes)
    redirect_to "/books/#{id}"
  end

  private

  def book_params
    params.permit(book:[:name, :author, :description, :votes])
  end

end
