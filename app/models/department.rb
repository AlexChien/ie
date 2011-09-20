class Department < ActiveRecord::Base
  has_many :jobs
  validates_presence_of :name_en,:name_zh_cn
  
  def name
    if I18n.locale.to_s == "en"
      self.name_en
    else
      self.name_zh_cn
    end
  end
end
