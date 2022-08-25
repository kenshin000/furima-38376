require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    sleep 0.1 
  end
  describe '商品購入機能' do
    context '商品購入できる場合' do
      it '必要な値がすべてが存在すれば購入できる' do
        expect(@order_address).to be_valid
      end
      it 'building_nameは空でも購入できる' do
      end
    end

    context '商品購入できない場合' do
      it 'post_codeが空では購入できない' do
      end
      it ' post_codeは、「3桁ハイフン4桁」の半角文字列でないと購入できない' do
      end
      it 'area_idが1では購入できない' do
        @order_address.area_id = '1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Area can't be blank")
      end
      it 'municipalitiesが空では購入できない' do
      end
      it 'addressがnumberが空では購入できない' do
      end
      it 'phone_numberが空では購入できない' do
      end
      it 'phone_numberは10桁以上11桁以内の半角数値でないと購入できない' do
      end
    end


  end
end
