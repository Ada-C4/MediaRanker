class BooksController < ApplicationController

  def index
    @books = Book.all.sort_by { |book| -book.rank }
  end
end
