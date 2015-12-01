class MoviesController < ApplicationController

 def index
   @movies = Movie.all.order(:upvotes).reverse
 end

 def show

 end

 def new

 end

 def edit

 end

 def create

 end

 def update

 end

 def destroy

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
