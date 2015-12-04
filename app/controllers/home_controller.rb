class HomeController < ApplicationController
  before_action :get_movies
  before_action :get_books
  before_action :get_albums

  def index
  end

  private

  def get_movies
    @movies = Movie.all
  end

  def get_books
    @books = Book.all
  end

  def get_albums
    @albums = Album.all
  end
end
