class Movie < ActiveRecord::Base

  def self.top_ten
    Movie.order("ranking DESC").limit(10)
  end

end
