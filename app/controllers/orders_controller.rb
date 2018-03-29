class OrdersController < ApplicationController
  def index
    @orders = Order.all.order(:orderNum)
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new
    @order.orderNum = params[:order][:orderNum]
    @order.orderTotal = params[:order][:orderTotal]
    @order.category = params[:order][:category]
    @order.paymentStatus = params[:order][:paymentStatus]
    @order.receiptNum = params[:order][:receiptNum]
    @order.delivery = params[:order][:delivery]
    @order.deliveryDate = params[:order][:deliveryDate]
    @order.orderStatus = params[:order][:orderStatus]
    @order.user = current_user

    if @order.save
      flash[:notice] = "Order successfully created."
      redirect_to @order
    else
      flash.now[:alert] = "There was an error creating the order. Please try again."
      render :edit
    end
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.orderNum = params[:order][:orderNum]
    @order.orderTotal = params[:order][:orderTotal]
    @order.category = params[:order][:category]
    @order.paymentStatus = params[:order][:paymentStatus]
    @order.receiptNum = params[:order][:receiptNum]
    @order.delivery = params[:order][:delivery]
    @order.deliveryDate = params[:order][:deliveryDate]
    @order.orderStatus = params[:order][:orderStatus]

    if @order.save
      flash[:notice] = "Order was updated."
      redirect_to @order
    else
      flash.now[:alert] = "There was an error saving the order. Please try again."
      render :edit
    end
  end

  def destroy
    @order = Order.find(params[:id])

    if @order.destroy
      flash[:notice] = "\"#{@order.orderNum}\" was successfully deleted."
      redirect_to orders_path
    else
      flash.now[:alert] = "There was an error deleting the order. Please try again."
      render :show
    end
  end
end
