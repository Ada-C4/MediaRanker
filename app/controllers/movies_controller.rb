class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.create(movie_params[:movie])
    redirect_to movie_path(id: @movie.id)
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    Movie.update(params[:id], movie_params[:movie])
    redirect_to movie_path(params[:id])
  end

  def destroy
    Movie.destroy(params[:id])
    redirect_to movies_path
  end

  private

  def movie_params
    params.permit(movie: [:name, :director, :description])
  end
end
