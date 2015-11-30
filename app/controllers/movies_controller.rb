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

  def edit
    id = params[:id]
    @movie = Movie.find(id)
  end

  def update
    id = params[:id]
    @movie = Movie.find(id)
    @movie.update(
    name: movie_params[:movie][:name],
    director: movie_params[:movie][:director],
    description: movie_params[:movie][:description]
    )
    redirect_to "/movies/#{id}"
  end

  def destroy
    id = params[:id]
    Movie.destroy(id)
    redirect_to "/movies/"
  end

  private

  def movie_params
    params.permit(movie:[:name, :director, :description, :upvotes])
  end
end
