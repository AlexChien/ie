class Page < ActiveRecord::Base
  acts_as_tree
  belongs_to :template
  has_many :contents
  
  scope :root_page, :conditions => ["parent_id is null"]
  scope :root_page_exclude_home, :conditions => ["parent_id is null and name_en != ?","Home"]
  scope :eq_name_zh_cn, lambda {|name_zh_cn|
    {:conditions => ["pages.name_zh_cn = ?", name_zh_cn] }
  }
  
  validates_presence_of :name_en,:name_zh_cn,:path,:template_id
  validates_uniqueness_of :name_en,:name_zh_cn,:path
  
  def name
    "#{name_zh_cn}(#{name_en})"
  end
  
  def show_columns(column)
    case column
    when "name"
      if I18n.locale.to_s == "en"
        self.name_en
      else
        self.name_zh_cn
      end
    when "html_content"
      if I18n.locale.to_s == "en"
        self.html_content
      else
        self.html_content_en
      end
    end
  end
  
  def find_last_subpage
    subpage = self
    if self.children.size > 0
      subcat = self.children.first
      subpage = subcat.find_last_subpage
    end
    return subpage
  end
  
  def find_all_subpage_ids(ids=[])
    if self.children.size > 0
      self.children.each do |subcat|
        if subcat.children.size > 0
          subcat.find_all_subpage_ids(ids)
        else
          ids << subcat.id
        end
      end
    end
    ids << self.id
  end
  
  def self.show_path(name)
    path = ''
    p = Page.find_by_name_zh_cn(name)
    p.path if p
  end
end
