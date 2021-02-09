class Item < ApplicationRecord

  belongs_to :user
  has_one :order
  
  has_one_attached :image

  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping
  belongs_to :prefecture
  belongs_to :scheduled

end
