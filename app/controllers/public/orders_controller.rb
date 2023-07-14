class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def index
    @order = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def confirm
  end

  def complete
  end

  def create
  end

end
