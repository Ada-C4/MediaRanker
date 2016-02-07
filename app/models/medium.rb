class Medium < ActiveRecord::Base
  validates :name, presence: true
  validates :type, presence: true

  def self.types
    %w(Movie Book Album)
  end
end
