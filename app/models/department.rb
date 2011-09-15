class Department < ActiveRecord::Base
  has_many :jobs
  validates_presence_of :name_en,:name_zh_cn
  
  def name
    "#{name_zh_cn}(#{name_en})"
  end
end
