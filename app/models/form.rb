class Form

  include ActiveModel::Model
  attr_accessor :item,:user_id,:item_id,:postal_code,:prefecture_id,:city,:address,:building,:phone_number,:order,:token

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'Input correctly' }
    validates :city
    validates :address 
    validates :phone_number, format: { with: /\A\d{11}\z/, message: 'Input only number' }
    validates :token
  end

  with_options presence: true, numericality: { other_than: 1, message: 'Select' } do
    validates :prefecture_id
   end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end
  
end
