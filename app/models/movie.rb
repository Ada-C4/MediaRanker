class Movie < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 100 }
  validates :description, length: {maximum: 500 }
  validates :director, length: {maximum: 100 }

end
