class MyController < ApplicationController
  before_filter :login_required

  def orders
    order = Order
    order = order.in_user(current_user) unless current_user.has_role?("admin")
    @orders = order.paginate(:all,:per_page=>20,:page => params[:page], :order => 'created_at DESC')
  end

  def order_show
    @order = Order.find(params[:id])
    unless current_user.has_role?("admin")
      if @order.user != current_user
        render :text => "不能查看他人订单"
      end
    end
  end

end
