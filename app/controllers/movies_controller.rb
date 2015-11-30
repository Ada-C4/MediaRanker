class MoviesController < ApplicationController
  def index
  end

  def upvote
    @movie = Movie.find(params[:id])
    @movie.update_attribute(:ranking, @movie.ranking + 1)
    redirect_to action: :show
  end

  def show
    @movie = Movie.find(params[:id])
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
