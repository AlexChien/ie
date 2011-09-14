class Translator < ActiveRecord::Base
  validates_presence_of :name_en, :name_zh_cn
end
