class MoviesController < ApplicationController
  def index
    @movies = Movie.order(upvotes: :desc)
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
      render :new
    end
  end

  def edit
    id = params[:id]
    @movie = Movie.find(id)
  end

  def update
    id = params[:id]
    @movie = Movie.find(id)
    @movie.update(
    name: movie_params[:movie][:name],
    director: movie_params[:movie][:director],
    description: movie_params[:movie][:description]
    )
    redirect_to movie_path(@movie)
  end

  def destroy
    id = params[:id]
    Movie.destroy(id)
    redirect_to movies_path
  end

  def upvote
    id = params[:id]
    @movie = Movie.find(id)
    current_score = Movie.find(id).upvotes
    if current_score.nil?
      new_score = 1
    else
      new_score = current_score + 1
    end
    @movie.update(
    upvotes: new_score
    )
    redirect_to movie_path(@movie)
  end

  private

  def movie_params
    params.permit(movie:[:name, :director, :description, :upvotes])
  end
end
