class WelcomeController < ApplicationController
  def index
    movies = Movie.all
    @movies = movies.order(votes: :desc).first(10)
  
  end
end
