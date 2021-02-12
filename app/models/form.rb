class Form
  include ActiveModel::Model
  attr_accessor :item,:user,:postal_code,:prefecture_id,:city,:address,:building,:phone_number,:order

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :item
    validates :user
  end


  with_options presence: true do
    validates :postal_code 
    validates :city
    validates :address 
    validates :phone_number
    validates :oorder
  end

  with_options presence: true,numericality: { other_than: 1 } do
    validates :prefecture_id
   end

  def save
    # 各テーブルにデータを保存する処理を書く
    @address = Address.new
    @order = Order.new
  end
  
end
