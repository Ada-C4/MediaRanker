class BooksController < ApplicationController

  def index
  end

  def create
    redirect_to books_path
  end

  def new
  end

  def edit
  end

  def show
  end

  def update
    redirect_to books_path
  end

  def destroy
    redirect_to books_path
  end

end
