class Album < ActiveRecord::Base
  validates :name, presence: true
  validates :upvotes, numericality: true
end
