class Medium < ActiveRecord::Base
  validates :name, presence: true

  scope :movie, -> { where(type: 'Movie') }
  scope :book, -> { where(type: 'Book') }
  scope :album, -> { where(type: 'Album') }

  def self.types
    %w(Movie Book Album)
  end
end

# binding.pry
class Movie < Medium; end
class Book < Medium; end
class Album < Medium; end
