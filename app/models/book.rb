class Book < ActiveRecord::Base

  def self.top_ten
    Book.order("ranking DESC").limit(10)
  end

  def self.by_ranking
    Book.order("ranking DESC")
  end

end
