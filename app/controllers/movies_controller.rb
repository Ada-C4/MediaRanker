class MoviesController < ApplicationController
  def index
    @media = Movie.order(ranking: :desc)
  end

  def show
    @media = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(strong_params)
    if @movie.save
      redirect_to movie_path(@movie.id)
    else
      render "new"
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @media = Movie.find(params[:id])
    @media.attributes = strong_params
    if @media.save
      render "show"
    else
      render "new"
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
