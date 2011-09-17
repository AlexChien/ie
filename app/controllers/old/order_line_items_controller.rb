class OrderLineItemsController < ApplicationController
  before_filter :login_required

  def create
    quantity = params[:order_line_item][:quantity].to_i
    property_id = params[:order_line_item][:property_id]
    if quantity <= 0
      @error_message = "购买数量不能小于0"
    end

    if property_id.blank?
      @error_message = "请选择投递方式"
    end

    unless @error_message
      p = Property.find(property_id)
      oli = OrderLineItem.in_user(current_user).in_property(p).ordered(false).first
      unless oli
        @order_line_item = OrderLineItem.new(params[:order_line_item])
        @order_line_item.user = current_user
        @order_line_item.unit_price = p.price
        @order_line_item.total_price = quantity * p.price
        @order_line_item.save
      else
        oli.update_attributes(:quantity=>oli.quantity + quantity,:total_price=>oli.total_price + quantity * p.price)
      end
    end
    render :partial => "items_list"
  end

  def update_quantity
    oli = OrderLineItem.find(params[:id])
    quantity = params[:quantity].to_i
    if quantity <= 0
      @error_message = "购买数量不能小于0"
    end
    if @error_message || oli.user != current_user
    else
      oli.update_attributes(:quantity=>quantity,:total_price=>quantity * oli.property.price)
    end
    render :partial => "items_list"
  end

  def destroy
    oli = OrderLineItem.find(params[:id])
    oli.destroy if oli.user == current_user
    render :partial => "items_list"
  end

end
