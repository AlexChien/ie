class Content < ActiveRecord::Base
  belongs_to :category
  
  validates_presence_of :title,:category_id
end
