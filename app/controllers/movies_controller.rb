class MoviesController < ApplicationController

  def get_movie
    @movie = Movie.find(params[:movie_id])
  end

  def index
  end

  def new
  end

  def show
    get_movie
  end

  def update
  end

  def create
  end

  def destroy
  end

  private

  def movie_params
    params.permit(:movie[:name, :director, :description])
  end
end
