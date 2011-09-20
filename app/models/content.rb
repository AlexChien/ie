class Content < ActiveRecord::Base
  belongs_to :page
  has_many :uploads, :as=>:resource
  
  validates_presence_of :title,:title_en,:issue_date,:page_id
  
  scope :in_ids, lambda {|ids|
    { :include=> [:page],:conditions => ["pages.id in (?)", ids] }
  }
  # link_type [["无链接",0], ["自行填写",1],["自动生成",2]]
  
  def self.list_contents(page_name,limit=nil)
    p=Page.eq_name_zh_cn(page_name).first
    if p
      ids = p.find_all_subpage_ids
      self.in_ids(ids).all(:order=>"contents.issue_date DESC",:limit=>limit)
    else
      []
    end
  end
  
  def show_columns(column)
    case column
    when "title"
      if I18n.locale.to_s == "en"
        self.title_en
      else
        self.title
      end
    when "source"
      if I18n.locale.to_s == "en"
        self.source_en
      else
        self.source
      end
    when "desc"
      if I18n.locale.to_s == "en"
        self.desc_en
      else
        self.desc
      end
    end
  end
  
  def show_title
    case self.link_type
    when 0
      self.show_columns('title')
    when 1
      "<a href='#{self.source_link}'>#{self.show_columns('title')}</a>"
    when 2
      "<a href='/contents/#{self.id}'>#{self.show_columns('title')}</a>"
    end
  end
  
  def show_link
    case self.link_type
    when 0
      ''
    when 1
      self.source_link
    when 2
      "/contents/#{self.id}"
    end
  end
  
end
