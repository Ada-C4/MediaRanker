class Book < ActiveRecord::Base
  validates :name, presence: true
  validates :description, length:  {maximum: 200}
  validates :description, presence: true
  validates :author, presence: true
end
