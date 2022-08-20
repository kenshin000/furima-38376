class ItemsController < ApplicationController

  def index
    @items = Item.all
  end


  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  private

  def item_params
    params.require(:item).permit(:name, :item_explain, :price, :image, 
      :category_id, :situation_id, :area_id, :send_day_id, :send_load_id,).merge(user_id: current_user.id)
  end


end
