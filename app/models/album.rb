class Album < ActiveRecord::Base
  validates :name, presence:true

  def self.page_grammer
    item_path = "/albums/"
    content_type = "Album"
    return item_path, content_type
  end
  
end
