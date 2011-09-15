class Content < ActiveRecord::Base
  belongs_to :category
  has_many :assets, :as=>:resource
  
  validates_presence_of :title,:title_en,:category_id
end
