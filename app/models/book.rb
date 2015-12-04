class Book < ActiveRecord::Base
  validates :title, presence: true
  validates :ranking, presence: true, numericality: {equal_to: 0}, on: :create
  validates :ranking, presence: true

  def self.by_ranking
    Book.order("ranking DESC")
  end
end
