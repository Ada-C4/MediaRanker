class HomeController < ApplicationController

  def index
    @movies = Movie.all
    @movies_sort = @movies.sort_by{ |movie| movie[:rank] }.reverse
    @movies_ten = @movies.first(10)
  end
end
