class Movie < ActiveRecord::Base
  validates :name, presence: true
  validates :director, presence: true
  validates :description, presence: true
  validates :rank, presence: true, numericality: true
end
