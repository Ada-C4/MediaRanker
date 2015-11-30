class HomeController < ApplicationController

  def all_media
  	# x is the number of items that will show in the 'top' display
  	x = 2
  	@top_movies = Movie.order(votes: :desc).limit(x)
  	@top_books = Book.order(votes: :desc).limit(x)
  	@top_albums = Album.order(votes: :desc).limit(x)
  end

end
