class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def new
    @url = "create"
    @movie = Movie.new
  end

  def create
    @movie = Movie.create(movie_params[:movie])
    redirect_to "/movies"
  end

  def show
    @movie = Movie.find(params[:movie])
  end

  def edit
    @url = "update"
    @movie = Movie.find(params[:id])
  end

  def update
    Movie.update(params[:id], movie_params[:movie])
    redirect_to "/movies"
  end

  def destroy
    Movie.destroy(params[:id])
    redirect_to "/movies/"
  end

private

  def movie_params
    params.permit(movie: [:name, :director, :description, :rank])
  end
end
