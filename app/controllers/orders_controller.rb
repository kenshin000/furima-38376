class OrdersController < ApplicationController

  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order_address = OrderAddress.new(order_params)
  end



  private

  def order_params
    params.request(:order_address).permit(:post_code, :municipalities, :address_number, :building_name, :phone_number, :area_id).merge(user_id: current_user.id)
  end

end
