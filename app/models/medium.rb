class Medium < ActiveRecord::Base
  validates :name, presence: true
  validates :kind, presence: true
end
