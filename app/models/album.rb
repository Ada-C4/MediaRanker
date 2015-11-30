class Album < ActiveRecord::Base
  validates :name, presence:true
  validates :artist, presence:true
  validates_length_of :description, :maximum => 200
end
