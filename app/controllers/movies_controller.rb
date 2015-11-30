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
    Movie.create(movie_params[:movie])
    redirect_to movies_path
  end

  def destroy
    id = params[:id]
    Movie.delete(id)
    redirect_to movies_path
  end

  def edit
    id = params[:id]
    @movie = Movie.find(id)
    session[:return_to] = request.referer
  end

  def update
    id = params[:id]
    movie = Movie.find(id)
    movie.update(
    name: movie_params[:movie][:name],
    director: movie_params[:movie][:director],
    description: movie_params[:movie][:description],
    )
    movie.save
    if session[:return_to].nil?
      redirect_to "/"
    else
      redirect_to session[:return_to]
    end
    session[:return_to] = nil
  end


  private

  def movie_params
    params.permit(movie:[:name, :director, :description])
  end
end
