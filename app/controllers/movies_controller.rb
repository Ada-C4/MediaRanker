class MoviesController < ApplicationController
  def sort(data)
    d = data.sort_by { |instance| instance.ranking }
    d.reverse
  end

  def index
    @media = sort(Movie.all)
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

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.attributes = strong_params
    if @movie.save
      render "show"
    else
      render "new"
    end
  end

  def destroy
    movie = Movie.find(params[:id])
    movie.destroy
    redirect_to movies_path
  end

  def upvote
    @movie = Movie.find(params[:id])
    @movie.ranking += 1
    @movie.save
    render "show"
  end

  private

  def strong_params
    params.require(:movie).permit(:name, :director, :description, :ranking)
  end
end
