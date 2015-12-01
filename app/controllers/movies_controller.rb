class MoviesController < ApplicationController
  def index
    movies = Movie.all

    @media = movies.order(votes: :desc) if params[:order].nil?

    @media = movies.order(votes: :asc) if params[:order] == 'asc'
    @media = movies.order(votes: :desc) if params[:order] == 'desc'

  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params[:movie])

    if @movie.save
      redirect_to movie_path(@movie)
    else
      render :new
    end

  end

  def show
    @art = Movie.find(params[:id])
    @art_attribute = @art.director
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

  def upvote
    movie = Movie.find(params[:id])
    movie.increment!(:votes)

    redirect_to :back
  end


  private

  def movie_params
    params.permit(movie:[:title, :director, :description])
  end

end
