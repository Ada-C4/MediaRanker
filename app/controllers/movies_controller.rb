class MoviesController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end

private
  def movie_params
    #this makes strong params
    params.require(:movie).permit(:title, :artist, :description, :votes)
  end
end
