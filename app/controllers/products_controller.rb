class ProductsController < ApplicationController
  # before_filter :login_required

  def index
    @order_line_item = OrderLineItem.new
    @product = Product.first
  end

end
