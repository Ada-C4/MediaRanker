class MoviesController < ApplicationController
  def index
    @movies = Movie.order(ranking: :desc)
  end

  def upvote
    @movie = Movie.find(params[:id])
    if @movie.ranking.nil?
      ranking = 1
    else
      ranking = @movie.ranking + 1
    end
    @movie.update(ranking: ranking)
    redirect_to movie_path(@movie.id)
  end

  def show
    id = params[:id]
    @movie = Movie.find(id)
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.create(movie_params[:movie])
    if @movie.save
      redirect_to movie_path(@movie)
    else
      render "new"
    end
  end

  def destroy
    id = params[:id]
    Movie.delete(id)
    redirect_to movies_path
  end

  def edit
    id = params[:id]
    @movie = Movie.find(id)
  end

  def update
    id = params[:id]
    movie = Movie.find(id)
    movie.update(
    name: movie_params[:movie][:name],
    director: movie_params[:movie][:director],
    description: movie_params[:movie][:description],
    )
    redirect_to movie_path(movie.id)
  end


  private

  def movie_params
    params.permit(movie:[:name, :director, :description])
  end
end
