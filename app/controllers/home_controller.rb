class HomeController < ApplicationController

  def all_media
  	@top_movies = Movie.order_by(:votes).limit(10)
  end

end
