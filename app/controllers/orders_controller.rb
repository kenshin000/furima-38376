class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]

  def index
    if current_user == @item.user
      redirect_to root_path
    end
    @order_address = OrderAddress.new
  end

  def create

    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end



  private

  def order_params
    params.require(:order_address).permit(:post_code, :municipalities, :address_number, 
      :building_name, :phone_number, :area_id, 
    ).merge(user_id: current_user.id, item_id:@item.id,)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
