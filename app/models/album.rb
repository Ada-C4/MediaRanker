class Album < ActiveRecord::Base
  def self.upvote
    self.increment!(:votes)
  end
end
