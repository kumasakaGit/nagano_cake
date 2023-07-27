class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  def index
    @cart_items = current_customer.cart_items.all
  end

  def create
    @item = Item.find(cart_item_params[:item_id])
    @cart_item = current_customer.cart_items.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if CartItem.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      cart_item.amount += params[:cart_item][:amount].to_i
      cart_item.save
      redirect_to public_cart_items_path
    elsif @cart_item.save
      @cart_items = current_customer.cart_items.all
      render :index
    else
      render :index
    end
  end

  def update
    @cart_item = current_customer.cart_items.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to public_cart_items_path
  end

  def destroy
    @cart_item = current_customer.cart_items.find(params[:id])
    @cart_item.destroy
    @cart_items = current_customer.cart_items.all
    redirect_to public_cart_items_path
  end

  def all_destroy
    @cart_items = current_customer.cart_items.all
    @cart_items.destroy_all
    redirect_to public_cart_items_path
  end

   private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
end
