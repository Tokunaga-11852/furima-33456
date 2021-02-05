require 'rails_helper'

RSpec.describe UserSettlement, type: :model do
  describe 'ユーザーのアドレス情報の保存' do
    before do
      item = FactoryBot.create(:item)
      user = FactoryBot.create(:user)
      @user_settlement = FactoryBot.build(:user_settlement, item_id: item.id, user_id: user.id)
      sleep 3
    end

    context '商品が購入できるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@user_settlement).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @user_settlement.building_name = ''
        expect(@user_settlement).to be_valid
      end
    end

    context '商品が購入できないとき' do
      it 'postal_codeが空だと保存できないこと' do
        @user_settlement.postal_code = ''
        @user_settlement.valid?
        expect(@user_settlement.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @user_settlement.postal_code = '0000000'
        @user_settlement.valid?
        expect(@user_settlement.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'shipment_source_area_idが1では保存できない' do
        @user_settlement.shipment_source_area_id = 1
        @user_settlement.valid?
        expect(@user_settlement.errors.full_messages).to include("Shipment source area can't be blank")
      end
      it 'municipalityが空では保存できないこと' do
        @user_settlement.municipality = ''
        @user_settlement.valid?
        expect(@user_settlement.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @user_settlement.address = ''
        @user_settlement.valid?
        expect(@user_settlement.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @user_settlement.phone_number = ''
        @user_settlement.valid?
        expect(@user_settlement.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberはハイフン不要で、11文字以内でないと保存できない' do
        @user_settlement.phone_number = '090-9988-77665'
        @user_settlement.valid?
        expect(@user_settlement.errors.full_messages).to include("Phone number phone_number is invalid. not Include hyphen(-). up to 11 characters")
      end
      it "tokenが空では登録できないこと" do
        @user_settlement.token = nil
        @user_settlement.valid?
        expect(@user_settlement.errors.full_messages).to include("Token can't be blank")
      end
      it 'user情報がnilだと保存できない' do
        @user_settlement.user_id = nil
        @user_settlement.valid?
        expect(@user_settlement.errors.full_messages).to include("User can't be blank")
      end
      it 'item情報がnilだと保存できない' do
        @user_settlement.item_id = nil
        @user_settlement.valid?
        expect(@user_settlement.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end