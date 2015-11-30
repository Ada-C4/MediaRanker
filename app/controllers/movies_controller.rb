class MoviesController < ApplicationController

  def sort(data)
    d = data.sort_by { |instance| instance.ranking }
    d.reverse
  end

  def index
    @movies = sort(Movie.all)
  end

  def show

  end

  def new
    @movie = Movie.new
  end

  def create

  end
end
