class MoviesController < ApplicationController
  def index
    @movies = Movie.all
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
    @movie = Movie.new
  end

  def create
    @movie = Movie.create(title: movie_params[:movie][:title],
                 description: movie_params[:movie][:description],
                 director: movie_params[:movie][:director],
                 ranking: 0)
    redirect_to movie_path(@movie.id)
  end

  def edit
    id = params[:id]
    @movie = Movie.find(id)
  end

  def update
    id = params[:id]
    @movie = Movie.find(id)
    @movie.update(movie_params[:movie])
    redirect_to movie_path(@movie.id)
  end


  def destroy
    id = params[:id]
    Movie.destroy(id)
    redirect_to movies_path
  end


  private

  def movie_params
    params.permit(movie:[:title, :description, :ranking, :director])
  end
end
