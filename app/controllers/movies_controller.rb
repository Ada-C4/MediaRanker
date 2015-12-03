class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.create(movie_params)
    @movie.update(:rank => 0)
    if @movie.save
      redirect_to movie_path(@movie.id)
    else
      render "new"
    end

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

  def destroy
    Movie.destroy(params[:id])
    redirect_to movies_path
  end

  def upvote
    movie = Movie.find(params[:id])
    rank = movie.rank
    rank += 1
    movie.update(rank: rank)
    redirect_to :back
  end



###########PRIVATE############
private

def movie_params
  params.require(:movie).permit(:name, :director, :description)
end

end
