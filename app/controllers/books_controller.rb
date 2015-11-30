class BooksController < ApplicationController
  def index
  end

  def show
  end

  def new
  end
  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def new
  end

  private

  def book_params
    params.permit(book:[:title, :description, :ranking, :author])
  end
end
