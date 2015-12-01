class Movie < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :description, length: { maximum: 300 }
end
