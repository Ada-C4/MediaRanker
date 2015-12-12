class BooksController < ApplicationController
  before_action :find_media, except: [:index, :new, :create]

  def index
    @media = Book.order(ranking: :desc)
  end

  def show
  end

  def new
    @media = Book.new
  end

  def create
    @media = Book.new(strong_params)
    @media.ranking = 0
    if @media.save
      render "show"
    else
      render "new"
    end
  end

  def edit
  end

  def update
    @media.attributes = strong_params
    if @media.save
      render "show"
    else
      render "edit"
    end
  end

  def destroy
    @media.destroy
    redirect_to books_path
  end

  def upvote
    @media.ranking += 1
    @media.save
    render "show"
  end

  private

  def strong_params
    params.require(:book).permit(:name, :author, :description, :ranking)
  end

  def find_media
    @media = Book.find(params[:id])
  end
end
