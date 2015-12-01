class MoviesController < ApplicationController

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.create(movie_params)
    redirect_to movie_path(@movie.id)
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    movie = Movie.find(params[:id])
    movie.update_attributes(movie_params)
    redirect_to movie_path(params[:id])
  end


###########PRIVATE############
private

def movie_params
  params.require(:movie).permit(:name, :director, :description)
end

end
