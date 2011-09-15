class Content < ActiveRecord::Base
  belongs_to :category
  has_many :assets
  
  validates_presence_of :title,:title_en,:category_id
end
