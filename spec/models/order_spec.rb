require 'rails_helper'

RSpec.describe Order, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  before do
    @order = FactoryBot.build(:order)
end

describe '商品購入機能' do
  context '商品購入できるとき' do
   it 'postal_code、prefecture_id、city、address、phone_number、入力で登録' do
     expect(@order).to be_valid
   end
  end


  context '商品購入できないとき' do 
   it 'postal_codeが空では登録できない' do
     @order.postal_code = ''
     @order.valid?
     expect(@order.errors.full_messages).to include("Postal_code can't be blank")
   end

   it 'cityが空では登録できない' do
     @order.city = ''
     @order.valid?
     expect(@order.errors.full_messages).to include("City can't be blank")
   end

   it 'addressが空では登録できない' do
     @order.address = ''
     @order.valid?
     expect(@order.errors.full_messages).to include("Address can't be blank")
   end

   it 'phone_numberが空では登録できない' do
    @order.phone_number = ''
    @order.valid?
    expect(@order.errors.full_messages).to include("Phone_number can't be blank")
  end



  it 'postal_codeの保存にはハイフンがないと登録できない' do
    @order.postal_code = '1234567'
    @order.valid?
    expect(@order.errors.full_messages).to include("Postal　code Input correctly")
  end

  it 'prefectureの保存は郵便番号・都道府県・市区町村・番地・電話番号が正確でないと登録できない' do
    @order.prefecture = ''
    @order.valid?
    expect(@order.errors.full_messages).to include("Prefecture Select")
  end

it 'phone_numberの保存は11桁以内の数値でないと登録できない' do
    @order.phone_number = '11111111111'
    @order.valid?
    expect(@order.errors.full_messages).to include("Phone　number Input only number")
  end



end
end
end


