class OrderLineItem < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  belongs_to :property
  belongs_to :order

  named_scope :in_user, lambda {|user_id|
        {:conditions => ["order_line_items.user_id in (?)", user_id]}
  }

  named_scope :in_product, lambda {|product_id|
        {:conditions => ["order_line_items.product_id in (?)", product_id]}
  }

  named_scope :in_property, lambda {|property_id|
        {:conditions => ["order_line_items.property_id in (?)", property_id]}
  }

  named_scope :ordered, lambda {|boolean|
    if boolean
      {:conditions => ["order_line_items.order_id is not null"]}
    else
      {:conditions => ["order_line_items.order_id is null"]}
    end
  }
end
