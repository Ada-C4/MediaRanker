class Album < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :title, length: { maximum: 100 }

  validates :artist, length: { maximum: 100 }
  
  validates :description, length: { maximum: 1000 }
end
