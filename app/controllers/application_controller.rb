class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    @movies = Movie.all.order(votes: :desc).limit(10)
    @books = Book.all.order(votes: :desc).limit(10)
    @albums = Album.all.order(votes: :desc).limit(10)
  end
  
end
