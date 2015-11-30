class BooksController < ApplicationController

  def index
  end

  def new
  end

  def show
  end

  def update
  end

  def create
  end

  def destroy
  end

  private

  def book_params
    params.permit(:book[:name, :author, :description])
  end

end
