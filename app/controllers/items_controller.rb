class ItemsController < ApplicationController

  private

  def message_params
    params.require(:items).permit(:name, :item_explain, :price, :image).merge(user_id: current_user.id)
  end

  
end
