class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!, only: [:show]
  def index
    @items = Item.page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
    @cart_item =CartItem
  end

  private
 def item_params
  params.require(:items).permit(:name, :introduction, :price)
 end

end
