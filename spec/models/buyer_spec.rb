require 'rails_helper'

RSpec.describe Buyer, type: :model do
  before do
    @buyer = FactoryBot.build(:buyer)
  end
  describe '購入内容確認' do
    context '商品購入がうまくいく時' do
      it '全ての値が正しく入力されていれば購入できること' do
        expect(@buyer).to be_valid
      end
    end
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buyer).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @buyer.post_code = ''
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @buyer.post_code = '1234567'
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'prefecture_idを選択していないと保存できないこと' do
        @buyer.prefecture_id = 0
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Prefecture_id can't be blank")
      end
      it 'cityは空でも保存できること' do
        @buyer.city = ''
        expect(@buyer).to be_valid
      end
      it 'house_numberは空でも保存できること' do
        @buyer.house_number = ''
        expect(@buyer).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @buyer.building_name = ''
        expect(@buyer).to be_valid
      end
      it 'priceが空だと保存できないこと' do
        @buyer.price = nil
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが全角数字だと保存できないこと' do
        @buyer.price = '２０００'
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include('Price is invalid')
      end
      it 'priceが1円未満では保存できないこと' do
        @buyer.price = 0
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include('Price is invalid')
      end
      it 'priceが1,000,000円を超過すると保存できないこと' do
        @buyer.price = 1000001
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include('Price is invalid')
      end
      it 'userが紐付いていないと保存できないこと' do
        @buyer.user_id = nil
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
