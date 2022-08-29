class OrderAddress

  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :municipalities, :address_number,
    :building_name, :phone_number, :area_id, :token

    with_options presence: true do
      validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
      validates :area_id, numericality: { other_than: 1, message: "can't be blank" } 
      validates :municipalities
      validates :address_number
      validates :phone_number,format: {with:/\A\d{10,11}\z/}
      validates :user_id
      validates :item_id
      validates :token
    end

    def save
      
      order = Order.create(item_id: item_id, user_id: user_id)
    
      Address.create(post_code: post_code, area_id: area_id, municipalities: municipalities, address_number: address_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
    end
  end
