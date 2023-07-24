class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def show
    @order = Order.find(params[:id])
    @total = 0
    @order.order_items.each do |order_item|
      @total += order_item.subtotal
    end
  end
end
