class OrdersController < ApplicationController
  def index
    @orders = Order.all.order(:orderNum)
  end

  def show
  end

  def new
  end

  def edit
  end
end
