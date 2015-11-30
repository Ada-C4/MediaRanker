class Album < ActiveRecord::Base

  def self.top_ten
    Album.order("ranking DESC").limit(10)
  end

end
