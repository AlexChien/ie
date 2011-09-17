class Template < ActiveRecord::Base
  has_many :pages
  
  validates_presence_of :name
end
