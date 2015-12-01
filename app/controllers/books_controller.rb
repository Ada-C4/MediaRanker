class BooksController < ApplicationController

  def index
    @books = Book.all.sort_by { |book| -book.rank }
  end

  def upvote
    b = Book.find(params[:id])
    b.rank += 1
    b.save
    redirect_to book_path(b)
  end

  def new
    @book = Book.new
  end

end
