class Item < ApplicationRecord

  belongs_to :user
  has_one :order
  
  has_one_attached :image


  with_options presence: true do
    validates :name
    validates :info 
    validates :category
    validates :sales_status
    validates :shipping
    validates :prefecture
    validates :scheduled
    validates :price
  end

  validates :image, presence: true
  validates :price, presence: true, format: { with: /\A[0-9]+\z/, message: "半角数字のみで入力して下さい" },
  inclusion: {in: 300..9999999, message: "¥300~¥9,999,999の範囲で入力して下さい" } 


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping
  belongs_to :prefecture
  belongs_to :scheduled

  with_options numericality: { other_than: 1 } do
   validates :category_id 
   validates :sales_status_id 
   validates :shipping_id 
   validates :prefecture_id 
   validates :scheduled_id 
  end

end