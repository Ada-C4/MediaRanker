class Movie < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :director, presence: true
  validates :ranking, presence: true

  def self.top_ten
    Movie.order("ranking DESC").limit(10)
  end

  def self.by_ranking
    Movie.order("ranking DESC")
  end

end
