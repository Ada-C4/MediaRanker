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

  private

  def movie_params
    params.permit(movie:[:name, :director, :description, :rank])
  end


end
