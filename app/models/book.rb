class Book < ActiveRecord::Base
  validates :name, presence:true
  validates :author, presence:true
  validates_length_of :description, :maximum => 200
end
