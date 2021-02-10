class Item < ApplicationRecord

  belongs_to :user
  has_one :order
  
  has_one_attached :image
  
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :status
    belongs_to :shipping
    belongs_to :prefecture
    belongs_to :scheduled

   with_options presence: true do
     validates :image
     validates :name
     validates :info 
     validates :price
   end

  validates :price, presence: true, format: { with: /\A[0-9]+\z/, message: "半角数字のみで入力して下さい" },
  numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "¥300~¥9,999,999の範囲で入力して下さい" }
  #inclusion: {in: 300..9999999, message: "¥300~¥9,999,999の範囲で入力して下さい" } 


  with_options presence: true,numericality: { other_than: 1 } do
   validates :category_id
   validates :status_id
   validates :shipping_id
   validates :prefecture_id
   validates :scheduled_id
  end

end
