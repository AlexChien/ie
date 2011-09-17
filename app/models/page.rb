class Page < ActiveRecord::Base
  acts_as_tree
  belongs_to :template
  has_many :contents
  
  scope :no_parent, :conditions => {:parent_id => nil} 
  
  validates_presence_of :name_en,:name_zh_cn
  
  def name
    "#{name_zh_cn}(#{name_en})"
  end
end
