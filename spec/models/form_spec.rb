require 'rails_helper'

RSpec.describe Form, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  before do  
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @form = FactoryBot.build(:form,user_id: @user.id,item_id: @item.id)
    sleep(1)
  end

describe '商品購入機能' do
  context '商品購入できるとき' do
   it 'postal_code、prefecture_id、city、address、phone_number、item、user入力で登録' do
     expect(@form).to be_valid
   end
  end


  context '商品購入できないとき' do 
   it 'postal_codeが空では登録できない' do
     @form.postal_code = ''
     @form.valid?
     expect(@form.errors.full_messages).to include("Postal code can't be blank")
   end

   it 'cityが空では登録できない' do
     @form.city = ''
     @form.valid?
     expect(@form.errors.full_messages).to include("City can't be blank")
   end

   it 'addressが空では登録できない' do
     @form.address = ''
     @form.valid?
     expect(@form.errors.full_messages).to include("Address can't be blank")
   end

   it 'phone_numberが空では登録できない' do
    @form.phone_number = ''
    @form.valid?
    expect(@form.errors.full_messages).to include("Phone number can't be blank")
  end



  it 'postal_codeの保存にはハイフンがないと登録できない' do
    @form.postal_code = '1234567'
    @form.valid?
    expect(@form.errors.full_messages).to include("Postal code Input correctly")
  end

  it 'prefectureの保存は郵便番号・都道府県・市区町村・番地・電話番号が正確でないと登録できない' do
    @form.prefecture_id = ''
    @form.valid?
    expect(@form.errors.full_messages).to include("Prefecture Select")
  end

it 'phone_numberの保存は11桁以内の数値でないと登録できない' do
    @form.phone_number = {maxlength: 11}
    @form.valid?
    expect(@form.errors.full_messages).to include("Phone number Input only number")
  end



end
end
end


