class OrdersController < ApplicationController
  def index
    # @orders = Order.where(customer_id: session[:customer_account]["id"]).joins(:products, :order_items)
    ids = Order.find(session[:customer_account]["id"])

    @order_items = OrderItem.where(order_id: ids).joins(:order, :product)
  end

  def show
  end
end
