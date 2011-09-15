class Content < ActiveRecord::Base
  belongs_to :category
  
  validates_presence_of :title,:title_en,:category_id
end
