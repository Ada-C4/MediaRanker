class MoviesController < ApplicationController
	before_action :set_movie, only: [:edit, :show, :update, :destroy, :upvote] 

  def new
  	@media = Movie.new
  end

  def create
  	@movie = Movie.new(movie_params)
  	@movie.votes = 0
  	if @movie.save
  		redirect_to movie_path(@movie)
  	else
  		render 'new'
  	end
  end

  def edit
  end

  def update
  	@media.update(movie_params)
  	redirect_to movie_path(@media)
  end

  def index
  	@media = Movie.order(votes: :desc)
  end

  def show
  end

  def destroy
  	@media.destroy
  	redirect_to movies_path
  end

  def upvote
  	@media.votes += 1
  	@media.save
  	redirect_to :back
  end

  private

  def movie_params
  	return params.require(:movie).permit(:name, :director, :description)
  end

  def set_movie
  	@media = Movie.find(params[:id])
  end

end
