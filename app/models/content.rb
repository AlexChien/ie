class Content < ActiveRecord::Base
  belongs_to :page
  has_many :uploads, :as=>:resource
  
  validates_presence_of :title,:title_en,:category_id
end
