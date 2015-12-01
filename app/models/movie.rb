class Movie < ActiveRecord::Base
  validates :name, presence:true

  def self.page_grammer
    item_path = "/movies/"
    content_type = "Movie"
    return item_path, content_type
  end
  
end
