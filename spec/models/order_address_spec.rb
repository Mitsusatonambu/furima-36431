require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入機能' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id) 
      sleep 1.0
    end

    context '入力内容が正しい時' do
      it '配送先情報を全て正しく入力したら購入できる' do
        expect(@order_address).to be_valid
      end

      it 'buildingは空でも登録できる' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end

    end

    context '入力内容が正しくない時' do
      it 'postal_codeが空だと登録できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeがハイフン無しの半角数字だと登録できない' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it 'prefectureが「---」だと登録できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空だと登録できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numberが空だと登録できない' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end

      it 'phone_numberが空だと登録できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが10〜11字の半角数字でないと登録できない' do
        @order_address.phone_number = '6666666666666'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end

      it 'userと紐付いてないと登録できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it 'itemと紐付いてないと登録できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end

    context 'クレジットカード機能' do
      it "tokenがあれば購入・保存ができる" do
          @order_address.token
          expect(@order_address).to be_valid
      end

      it "tokenが空だと購入・保存できない" do 
          @order_address.token = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

    end

    
  end
end
