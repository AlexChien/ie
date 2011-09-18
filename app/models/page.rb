class Page < ActiveRecord::Base
  acts_as_tree
  belongs_to :template
  has_many :contents
  
  scope :root_page, :conditions => ["parent_id is null"]
  scope :root_page_exclude_home, :conditions => ["parent_id is null and name_en != ?","Home"]
  
  validates_presence_of :name_en,:name_zh_cn
  
  def name
    "#{name_zh_cn}(#{name_en})"
  end
  
  def find_last_subpage
    subpage = self
    if self.children.size > 0
      subcat = self.children.first
      subpage = subcat.find_last_subpage
    end
    return subpage
  end
end
