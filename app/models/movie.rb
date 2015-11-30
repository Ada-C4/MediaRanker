class Movie < ActiveRecord::Base
  validates :name, presence:true
  validates :director, presence:true
  validates_length_of :description, :maximum => 200
end
