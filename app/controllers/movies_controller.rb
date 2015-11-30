class MoviesController < ApplicationController
  def index
  end

  def show
    @movie = Movie.find(id: params)
  end

  def new
  end
  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def new
  end

  private

  def movie_params
    params.permit(movie:[:title, :description, :ranking, :director])
  end
end
