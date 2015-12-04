class Movie < ActiveRecord::Base
  validates :title, presence: true, length: { maximum: 25 }
  validates :creator, presence: true
end
