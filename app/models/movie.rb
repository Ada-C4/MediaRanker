class Movie < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :title, length: { maximum: 100 }

  validates :director, length: { maximum: 100 }

  validates :description, length: { maximum: 1000 }
end
