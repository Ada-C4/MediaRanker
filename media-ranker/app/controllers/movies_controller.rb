class MoviesController < ApplicationController

  def index
    @movies = Movie.order(rank: :desc)
  end

  def create
    movie = Movie.create(movie_params)
    movie.update_attribute(:rank, 1)
    redirect_to movies_path
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def update
    movie = Movie.find(params[:id])
    movie.update(movie_params)
    redirect_to movies_path
  end

  def destroy
    movie = Movie.find(params[:id])
    movie.destroy
    redirect_to movies_path
  end

  def upvote
    movie = Movie.find(params[:id])
    rank = movie.rank + 1
    movie.update_attribute(:rank, rank)
    redirect_to(:back)
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :director, :description)
  end

end
