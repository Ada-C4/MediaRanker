class Album < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 100 }
  validates :description, length: {maximum: 500 }
  validates :artist, length: {maximum: 100 }

end
