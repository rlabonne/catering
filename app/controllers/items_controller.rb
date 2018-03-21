class ItemsController < ApplicationController
  def index
    @items = Item.all.order(:name)
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new
    @item.name = params[:item][:name]
    @item.description = params[:item][:description]
    @item.category = params[:item][:category]
    @item.yieldQty = params[:item][:yieldQty]
    @item.yieldUnit = params[:item][:yieldUnit]
    @item.servingQty = params[:item][:servingQty]
    @item.servingQty = params[:item][:servingQty]
    @item.price = params[:item][:price]
    @item.priceUnit = params[:item][:priceUnit]
    @item.notes = params[:item][:notes]

    if @item.save
      flash[:notice] = "Item was updated."
      redirect_to @item
    else
      flash.now[:alert] = "There was an error saving the item. Please try again."
      render :edit
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.name = params[:item][:name]
    @item.description = params[:item][:description]
    @item.category = params[:item][:category]
    @item.yieldQty = params[:item][:yieldQty]
    @item.yieldUnit = params[:item][:yieldUnit]
    @item.servingQty = params[:item][:servingQty]
    @item.servingQty = params[:item][:servingQty]
    @item.price = params[:item][:price]
    @item.priceUnit = params[:item][:priceUnit]
    @item.notes = params[:item][:notes]

    if @item.save
      flash[:notice] = "Item was updated."
      redirect_to @item
    else
      flash.now[:alert] = "There was an error saving the item. Please try again."
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])

    if @item.destroy
      flash[:notice] = "\"#{@item.name}\" was successfully deleted."
      redirect_to items_path
    else
      flash.now[:alert] = "There was an error deleting the item. Please try again."
      render :show
    end
  end
end
