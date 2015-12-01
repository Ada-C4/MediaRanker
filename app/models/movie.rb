class Movie < ActiveRecord::Base

  def self.top_ten
    Movie.order("ranking DESC").limit(10)
  end

  def self.by_ranking
    Movie.order("ranking DESC")
  end

end
