class Article < ActiveRecord::Base
  belongs_to :category

  validates_presence_of :title,:category_id

  named_scope :published, :conditions => ["is_published=1"]

  named_scope :in_category_id, lambda {|category_id|
    { :include=> [:category],:conditions => ["categories.id in (?)", category_id] }
  }

  def show_status
    if self.is_published
      "<img src='/images/published.gif' />"
    else
      "<img src='/images/draft.gif' />"
    end
  end

  def show_logo
    if self.category.name == "百人榜-沟通"
      "<span><img src='/images/bairen_gt.jpg' /></span>"
    elsif self.category.name == "百人榜-传承"
       "<span><img src='/images/bairen_chch.jpg' /></span>"
    elsif self.category.name == "百人榜-创新"
      "<span><img src='/images/bairen_chx.jpg' /></span>"
    else
      ""
    end
  end

end
