class MoviesController < ApplicationController
  # before_action :get_movie, only: [:edit, :update, :destroy]
  # def get_movie
  #   @movie = Movie.find(params[:id])
  # end

  def home
    @movies = Movie.all
    @books = Book.all
    @albums = Album.all
  end

  def index
    # @movie = Movie.find(params[:id])
    @movies = Movie.all
  end

  def new
    @url = "create"
    @movie = Movie.new
  end

  def create
    @movie = Movie.create(movie_params[:movie])
    if @movie.save
      redirect_to movies_path
    else
      render :new
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
    @legend = "Edit Movie"
  end

  def update
    @movie = Movie.update(params[:id], movie_params[:movie])
      if @movie.save
        redirect_to movie_path(params[:id])
      else
        render :edit
      end
  end

  def destroy
    Movie.destroy(params[:id])
    redirect_to movies_path
  end

  def upvote
    @movie = Movie.find(params[:id])
    @movie.rank += 1
    @movie.save
    render "show"
  end

private

  def movie_params
    params.permit(movie: [:name, :director, :description, :rank])
  end
end
