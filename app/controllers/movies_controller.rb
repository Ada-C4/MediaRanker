class MoviesController < ApplicationController

 def index
   @movies = Movie.all.order(:upvotes).reverse
 end

 def show
   @movie = Movie.find(params[:id])
 end

 def new
   @movie = Movie.new
 end

 def edit
   @movie = Movie.find(params[:id])
 end

 def create
   @movie = Movie.new(movie_params)
   if @movie.save
     redirect_to movie_path(@movie.id)
   else
     render :new
   end
 end

 def update
   @movie = Movie.update(params[:id], movie_params)
   if @movie.save
     redirect_to movie_path(@movie.id)
   else
     render :edit
   end
 end

 def destroy
  Movie.find(params[:id]).destroy
  redirect_to movies_path
 end

 def upvote
   movie = Movie.find(params[:id])
   movie.upvotes += 1
   movie.save!
   redirect_to movie_path(params[:id])
 end

 private

  def movie_params
    params.require(:movie).permit(:name, :director, :description)
  end

end
