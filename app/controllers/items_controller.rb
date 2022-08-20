class ItemsController < ApplicationController

  def index
  end

  def new
    @itme = Item.new
  end



  private

  def item_params
    params.require(:items).permit(:name, :item_explain, :price, :image, :category_id, :situation_id,
      :area_id, :send_day_id, :send_load_id,
    ).merge(user_id: current_user.id)
  end


end
