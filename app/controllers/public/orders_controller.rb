class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
    if @order.save
      cart_items.each do |cart_item|
        order_item = OrderItem.new
        order_item.item_id = cart_item.item_id
        order_item.order_id = @order.id
        order_item.amount = cart_item.amount
        order_item.price = cart_item.item.with_tax_price
        order_item.save
      end
      redirect_to public_orders_complete_path
      cart_items.destroy_all
    else
      @order = Order.new(order_params)
      render :new
    end
  end

  def index
    @orders = Order.all
  end

  def show
    @order = current_customer.orders.find(params[:id])
  end

  def confirm
    @order = Order.new(order_params)
    @order.name = current_customer.last_name + current_customer.first_name
    @order.shopping_address = current_customer.address
    @order.postal_code = current_customer.postal_code
    @cart_items = current_customer.cart_items.all
  end

  def complete
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :name, :shopping_address, :postal_code, :shopping_charge, :billing_amount, :payment_methods)
  end
end
