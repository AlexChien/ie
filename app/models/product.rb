class Product < ActiveRecord::Base
  has_many :properties
  has_many :order_line_items
end
