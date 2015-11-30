class MoviesController < ApplicationController
  def sort(data)
    d = data.sort_by { |instance| instance.ranking }
    d.reverse
  end

  def index
    @movies = sort(Movie.all)
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(strong_params)
    if @movie.save
      redirect_to movie_path(@movie.id)
    else
      render "new"
    end
  end

  private

  def strong_params
    params.require(:movie).permit(:name, :director, :description, :ranking)
  end
end
