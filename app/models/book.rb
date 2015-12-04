class Book < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 100 }
  validates :description, length: {maximum: 500 }
  validates :author, length: {maximum: 100 }

end
