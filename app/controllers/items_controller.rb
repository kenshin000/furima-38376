class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :limit_user, only: [:edit, :destroy]

  def index
    @items = Item.order('created_at DESC')
  end

  def show
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

  def edit
    if @item.order.present?
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
    redirect_to item_path
    else
    render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :item_explain, :price, :image,
    :category_id, :situation_id, :area_id, :send_day_id, :send_load_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def limit_user
    redirect_to root_path unless current_user.id == @item.user_id
  end
end
