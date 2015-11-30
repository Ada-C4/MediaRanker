class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    new_movie = Movie.create(movie_params[:movie])
    redirect_to movie_path(new_movie)
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    Movie.update(params[:id], movie_params[:movie])
    redirect_to movie_path(params[:id])
  end

  def destroy
    Movie.destroy(params[:id])
    redirect_to movies_path
  end

  private

  def movie_params
    params.permit(movie:[:name, :director, :description, :rank])
  end


end
