class Book < ActiveRecord::Base
  validates :name, presence:true

  def self.page_grammer
    item_path = "/books/"
    content_type = "Book"
    return item_path, content_type
  end
  
end
