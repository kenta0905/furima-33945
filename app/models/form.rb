class Form

  include ActiveModel::Model
  attr_accessor :item,:user_id,:item_id,:postal_code,:prefecture_id,:city,:address,:building,:phone_number,:order

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :item_id
    validates :user_id
  end


  with_options presence: true do
    validates :postal_code 
    validates :city
    validates :address 
    validates :phone_number
    validates :order
  end

  with_options presence: true,numericality: { other_than: 1 } do
    validates :prefecture_id
   end

  def save
    # 各テーブルにデータを保存する処理を書く
    order = Order.create(item: item, user_id: user_id)
    address = Address.create(postal_code: postal_code, prefecture: prefecture, city: city, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end
  
end
