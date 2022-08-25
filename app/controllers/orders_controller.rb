class OrdersController < ApplicationController

  def index
    @order_address = OrederAddress.new
  end
end
