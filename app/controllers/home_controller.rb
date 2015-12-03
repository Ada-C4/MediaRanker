class HomeController < ApplicationController

  def index
    @movies = Movie.all
    @movies_sort = @movies.sort_by{ |movie| movie[:rank] }.reverse
  end
end
