require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品情報入力' do
    context '商品情報入力がうまくいく時' do
      it '全ての値が正しく入力されていれば出品できること' do
        expect(@item).to be_valid
      end
    end
    context '商品情報の入力がうまく行かない時' do
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'item_nameが空だと出品できない' do
        @item.item_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'conditionが空だと出品できない' do
        @item.condition = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'categoryが未選択だと出品できない' do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can’t be blank")
      end
      it 'categoryが1では登録できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can’t be blank")
      end
      it 'brandが未選択だと出品できない' do
        @item.brand_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Brand can’t be blank")
      end
      it 'brandが1では登録できないこと' do
        @item.brand_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Brand can’t be blank")
      end
      it 'carriageが未選択だと出品できない' do
        @item.carriage_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Carriage can’t be blank")
      end
      it 'carriageが1では登録できないこと' do
        @item.carriage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Carriage can’t be blank")
      end
      it 'prefectureが未選択だと出品できない' do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can’t be blank")
      end
      it 'prefectureが1では登録できないこと' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can’t be blank")
      end
      it 'ship_dateが未選択だと出品できない' do
        @item.ship_date_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship date can’t be blank")
      end
      it 'ship_dateが1では登録できないこと' do
        @item.ship_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship date can’t be blank")
      end
      it 'priceが空では出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが全角数字では出品できない' do
        @item.price = "２０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Half-width number")
      end
      it 'priceが全角文字では登録できないこと' do
        @item.price = "あカA５"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Half-width number")
      end
      it 'priceが半角英数混合では登録できないこと' do
        @item.price = "12aA"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Half-width number")
      end
      it 'priceが半角英語だけでは登録できないこと' do
        @item.price = "abcd"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Half-width number")
      end
      it 'nameが41文字以上であれば登録できない' do
        @item.item_name = "a"*41
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name is too long (maximum is 40 characters)")
      end
      it 'priceが9999999を超えた場合登録できない' do
        @item.price = 9999999999
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it 'priceが300未満なら登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
    end
  end
end