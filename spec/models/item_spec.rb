require 'rails_helper'
RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end
      describe '新規商品出品' do
        context '新規商品出品できるとき' do
          it 'imageからpriceまでの9項目に情報が存在すれば登録できる' do
            expect(@item).to be_valid
          end
        end

        context '新規商品出品できない時' do
          it 'imageが空では出品できない' do
            @item.image = nil
            @item.valid?
            expect(@item.errors.full_messages).to include("Image can't be blank")
          end
          it 'item_nameが空では出品できない' do
            @item.item_name = ''
            @item.valid?
            expect(@item.errors.full_messages).to include("Item name can't be blank")
          end
          it 'item_informationが空では出品できない' do
            @item.item_information = ''
            @item.valid?
            expect(@item.errors.full_messages).to include("Item information can't be blank")
          end
          it 'category_idが1では出品できない' do
            @item.category_id = 1
            @item.valid?
            expect(@item.errors.full_messages).to include("Category must be other than 1")
          end
          it 'item_condition_idが1では出品できない' do
            @item.item_condition_id = 1
            @item.valid?
            expect(@item.errors.full_messages).to include("Item condition must be other than 1")
          end
          it 'shipping_charge_idが1では出品できない' do
            @item.shipping_charge_id = 1
            @item.valid?
            expect(@item.errors.full_messages).to include("Shipping charge must be other than 1")
          end
          it 'shipment_source_area_idが1では出品できない' do
            @item.shipment_source_area_id = 1
            @item.valid?
            expect(@item.errors.full_messages).to include("Shipment source area must be other than 1")
          end
          it 'days_to_ship_idが1では出品できない' do
            @item.days_to_ship_id = 1
            @item.valid?
            expect(@item.errors.full_messages).to include("Days to ship must be other than 1")

          end
          it 'priceが1では出品できない' do
            @item.price = ''
            @item.valid?
            expect(@item.errors.full_messages).to include("Price can't be blank")

          end
          it 'priceは、全角文字では出品できない' do
            @item.price = '３０００'
            @item.valid?
            expect(@item.errors.full_messages).to include('Price is out of setting range')
          end
          it 'priceは、半角英語では出品できない' do
            @item.price = 'Aa'
            @item.valid?
            expect(@item.errors.full_messages).to include('Price is out of setting range')
          end
          it 'priceは、半角英数混合では出品できない' do
            @item.price = '0Aa'
            @item.valid?
            expect(@item.errors.full_messages).to include('Price is out of setting range')
          end
          it 'priceは、299円以下では出品できない' do
            @item.price = 299
            @item.valid?
            expect(@item.errors.full_messages).to include('Price is out of setting range')
          end
          it 'priceは、10000000円以上では出品できない' do
            @item.price = 10000000
            @item.valid?
            expect(@item.errors.full_messages).to include('Price is out of setting range')
          end
        end
      end
  end
end