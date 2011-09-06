class Property < ActiveRecord::Base
  has_many :order_line_items
  belongs_to :product
end
