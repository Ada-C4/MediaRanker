class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    # code to sort movies by number of votes
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params[:movie])

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
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.attributes = movie_params[:movie]

    if @movie.save
      redirect_to movie_path(@movie)
    else
      render :edit
    end
  end

  def destroy
    movie = Movie.find(params[:id])
    movie.destroy

    redirect_to movies_path
  end


  private

  def movie_params
    params.permit(movie:[:title, :director, :description])
  end

end
