class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    id = params[:id]
    @movie = Movie.find(id)
  end

  def new
    @movie = Movie.new
  end

  def create
    id = params[:id]
    Movie.create(movie_params[:movie])
    redirect_to "/movies/#{id}"
  end


  private

  def movie_params
    params.permit(movie:[:name, :director, :description, :upvotes])
  end
end
