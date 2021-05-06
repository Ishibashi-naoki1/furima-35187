require 'rails_helper'

RSpec.describe OrderBuyer, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_buyer = FactoryBot.build(:order_buyer, user_id: @user.id, item_id: @item.id)
    sleep(1)
  end
  describe '購入内容確認' do
    context '商品購入がうまくいく時' do
      it '全ての値が正しく入力されていれば購入できること' do
        expect(@order_buyer).to be_valid
      end
    end
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_buyer).to be_valid
      end
      it "tokenがあれば保存ができること" do
        expect(@order_buyer).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @order_buyer.building_name = ''
        expect(@order_buyer).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it 'post_codeが空では保存できないこと' do
        @order_buyer.post_code = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_buyer.post_code = '1234567'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'prefecture_idを選択していないと保存できないこと' do
        @order_buyer.prefecture_id = 1
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Prefecture Select")
      end
      it 'cityは空では保存できないこと' do
        @order_buyer.city = ""
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("City can't be blank")
      end
      it 'addressは空では保存できないこと' do
        @order_buyer.address = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが電話番号以外では保存できないこと' do
        @order_buyer.phone_number = '1234567'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Phone number Phone number Input only number")
      end
      it 'phone_numberが空では保存できないこと' do
        @order_buyer.phone_number = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'user_idが紐付いていないと保存できないこと' do
        @order_buyer.user_id = nil
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが紐付いていないと保存できないこと' do
        @order_buyer.item_id = nil
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Item can't be blank")
      end
      it "tokenが空では登録できないこと" do
        @order_buyer.token = nil
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Token can't be blank")
      end
      
    end
  end
end
