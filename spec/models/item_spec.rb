require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do

   context '商品登録できるとき' do

   it 'name,info,category_id,status_id,shipping_id,prefecture_id,scheduled_id,price全ての入力で登録' do
         expect(@item).to be_valid
       end
   end
 

  context '商品出品できないとき' do 

  it 'imageが空では保存できない' do
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Image can't be blank")
  end

  it 'nameが空では保存できない' do
    @item.name = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Name can't be blank")
  end

  it 'infoが空では保存できない' do
    @item.info = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Info can't be blank")
  end

  it 'category_idが空では保存できない' do
    @item.category_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Category can't be blank")
  end

  it 'status_idが空では保存できない' do
    @item.status_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Status can't be blank")
  end

  it 'shipping_idが空では保存できない' do
    @item.shipping_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping can't be blank")
  end

  it 'prefecture_idが空では保存できない' do
    @item.prefecture_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Prefecture can't be blank")
  end

  it 'scheduled_idが空では保存できない' do
    @item.scheduled_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Scheduled can't be blank")
  end

  it 'priceが空では保存できない' do
    @item.price = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Price can't be blank")
  end
 
  it 'priceが¥300~¥9,999,999の間ではないと保存できない' do
    @item.price = '299'
    @item.valid?
    expect(@item.errors.full_messages).to include("Price ¥300~¥9,999,999の範囲で入力して下さい")
  end

  it 'priceが¥300~¥9,999,999の間ではないと保存できない' do
    @item.price = '10000000'
    @item.valid?
    expect(@item.errors.full_messages).to include("Price ¥300~¥9,999,999の範囲で入力して下さい")
  end

  it 'priceが半角数字のみではないと保存できない' do
    @item.price = '０００００'
    @item.valid?
    expect(@item.errors.full_messages).to include("Price 半角数字のみで入力して下さい")
  end

end
end
end
