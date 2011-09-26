class Story < ActiveRecord::Base
  validates_presence_of :title_en, :title_zh_cn, :pubdate
  scope :recent, :limit => 7, :order => "pubdate desc"
end
