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
  end

  def show
  end

  def update
    redirect_to movies_path
  end

  def destroy
    redirect_to movies_path
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :director, :description)
  end

end
