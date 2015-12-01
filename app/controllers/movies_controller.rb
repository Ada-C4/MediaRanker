class MoviesController < ApplicationController

  def index
    @movies = Movie.all.sort_by { |movie| -movie.rank }
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params[:movie])
    if @movie.save
      redirect_to movie_path(@movie)
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
    @movie = Movie.find(params[:id])
    @movie.update( movie_params[:movie])
    if @movie.save
      redirect_to movie_path(@movie)
    else
      render "edit"
    end
  end

  def destroy
    Movie.destroy(params[:id])
    redirect_to movies_path
  end

  def upvote
    m = Movie.find(params[:id])
    m.rank += 1
    m.save
    redirect_to movie_path(m)
  end

  private

  def movie_params
    params.permit(movie:[:name, :director, :description, :rank])
  end


end
