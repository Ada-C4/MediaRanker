class Book < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :author, presence: true
  validates :ranking, presence: true

  def self.top_ten
    Book.order("ranking DESC").limit(10)
  end

  def self.by_ranking
    Book.order("ranking DESC")
  end

end
