class OrdersController < ApplicationController
  before_filter :login_required, :only => [:new, :create,:show,:mark]
  skip_before_filter :verify_authenticity_token,:only => [:notify]

  def new
    @order = Order.new
    olis = OrderLineItem.in_user(current_user).all
    if olis.empty?
      redirect_to "/products"
    end
  end

  def create
    @order = Order.new(params[:order])
    @order.user = current_user
    oli = OrderLineItem.in_user(current_user).ordered(false)
    olis = oli.all
    if olis.empty?
      render :text => "购买商品不能空"
      return
    end
    Order.transaction do
      if @order.save
        amount = oli.first(:select=>"sum(total_price) as tp").tp.to_i
        olis.each do |oli|
          oli.update_attribute(:order,@order)
        end
        @order.update_attribute(:amount,amount)
        redirect_to "/orders/#{@order.id}"
      else
        render :action => "new"
      end
    end
  end

  def show
    @order = Order.find(params[:id])
    unless current_user.has_role?("admin")
      if @order.user != current_user
        render :text => "不能查看他人订单"
      end
    end
  end

  def notify
    notification = ActiveMerchant::Billing::Integrations::Alipay::Notification.new(request.raw_post)

    notification.acknowledge

    oid = params[:out_trade_no]
    @order = Order.find_by_oid(oid)

    case notification.status
    when "TRADE_SUCCESS"
      if @order.status == 0
        @order.update_attribute(:status,1)

        begin
          deliver_success_order(@order)
        rescue Timeout::Error => e
        end

      end
      render :text => "订单支付成功"
    else
      render :text => "订单支付失败"
    end
  end

  def done
    r = ActiveMerchant::Billing::Integrations::Alipay::Return.new(request.query_string)
    if r.success?
      @order = Order.find_by_oid(r.order)
      @order.update_attribute(:status,1)

      begin
        deliver_success_order(@order)
      rescue Timeout::Error => e
      end

      flash[:notice] = "您的订单支付成功"
      redirect_to "/my/#{@order.id}/order_show"
    else
      logger.warn(r.message)
      render :text => "支付失败"
    end
  end

  def show_order
    logger.info "show_order!!!"
  end

  def mark
    @order = Order.find(params[:id])
    if current_user.has_role?("admin")
      if @order.status == 1
        @order.update_attribute(:status,2)
      elsif @order.status == 0
        @order.update_attribute(:status,2)
      end
      redirect_to "/my/#{@order.id}/order_show"
    else
      render :text => "对不起，您不能标记此订单！"
    end
  end

protected
  def deliver_success_order(order)
    role = Role.find_by_name("admin")
    role.users.each do |user|
      UserMailer.deliver_order_notice(user,order)
    end
  end

end