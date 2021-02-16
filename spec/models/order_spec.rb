require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  it "token,item,userがあれば保存ができること" do
    expect(@order).to be_valid
  end

  it "tokenが空では登録できないこと" do
    @order.token = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Token can't be blank")
  end



  it "itemが空では登録できないこと" do
    @order.item = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Item can't be blank")
  end

  it "userが空では登録できないこと" do
    @order.user = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("User can't be blank")
  end



end