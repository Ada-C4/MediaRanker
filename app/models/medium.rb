class Medium < ActiveRecord::Base
  validates :name, presence: true
  validates :type, presence: true

  def self.types
    %w(Movie Book Album)
  end

  scope :albums, -> { where(type: 'Album') }
	scope :books, -> { where(type: 'Book') }
	scope :movies, -> { where(type: 'Movie') }

end
