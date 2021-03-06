require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe "商品入力成功" do
    it "商品入力成功しました" do
      expect(@item).to be_valid
    end
  end

  describe "商品入力失敗" do
    it "userが紐ついてなければ出品できない" do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
    it "imageが選択されてないと失敗する" do
       @item.image = nil
       @item.valid?
       expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it "nameが空欄のため失敗" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it "infoが空欄のため失敗" do 
      @item.info = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Info can't be blank")
    end
    it "categoryが空欄のため失敗" do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank") 
    end
    it "statusが空欄のため失敗" do 
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank") 
    end
    it "delivery_feeが空欄のため失敗" do
      @item.delivery_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee can't be blank")  
    end
    it "prefectureが空欄のため失敗" do 
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end
    it "delivery_dateが空欄のため失敗" do 
      @item.delivery_date_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery date can't be blank")
    end
    it "priceが空欄のため失敗" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank") 
    end
    it "priceが全角ひらがなであるため失敗" do 
      @item.price = 'あいうえお'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number") 
    end
    it "priceの範囲が¥300未満のため失敗" do 
      @item.price = 200  
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end
    it "priceの範囲が¥9999999より大きいため失敗" do 
      @item.price = 88888888
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end
    it "priceが小数点以下の数字があるため失敗" do 
      @item.price = 888.99
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be an integer")
    end
    it "priceが全角数字であるため失敗" do 
      @item.price = "９９９"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
    it "priceが半角英数字混合であるため失敗" do 
      @item.price = "n3m4m5"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
    it "priceが半角英語であるため失敗" do 
      @item.price = "huhuhu"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
  end
end
