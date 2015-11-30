class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def sort(data)
    d = data.sort_by { |instance| instance.ranking }
    d.reverse
  end

  def index
    @movies = sort(Movie.all)
    @books = sort(Book.all)
    @albums = sort(Album.all)
  end
end
