class Album < ActiveRecord::Base
  validates :title, presence: true
  validates :ranking, presence: true

  def self.top_ten
    Album.order("ranking DESC").limit(10)
  end

  def self.by_ranking
    Album.order("ranking DESC")
  end

end
