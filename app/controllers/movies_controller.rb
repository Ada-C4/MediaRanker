class MoviesController < ApplicationController
  def index
    @media = Movie.order(ranking: :desc)
  end

  def show
    @media = Movie.find(params[:id])
  end

  def new
    @media = Movie.new
  end

  def create
    @media = Movie.new(strong_params)
    @media.ranking = 0
    if @media.save
      redirect_to movie_path(@media.id)
    else
      render "new"
    end
  end

  def edit
    @media = Movie.find(params[:id])
  end

  def update
    @media = Movie.find(params[:id])
    @media.attributes = strong_params
    if @media.save
      render "show"
    else
      render "edit"
    end
  end

  def destroy
    movie = Movie.find(params[:id])
    movie.destroy
    redirect_to movies_path
  end

  def upvote
    @media = Movie.find(params[:id])
    @media.ranking += 1
    @media.save
    render "show"
  end

  private

  def strong_params
    params.require(:movie).permit(:name, :director, :description, :ranking)
  end
end
