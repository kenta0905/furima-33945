class Address < ApplicationRecord

  belongs_to :order

  belongs_to :prefecture

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  # with_options presence: true do
  #   validates :postal_code 
  #   validates :city
  #   validates :address 
  #   validates :phone_number
  #   validates :oorder
  # end

  # with_options presence: true,numericality: { other_than: 1 } do
  #   validates :prefecture_id
  #  end

end
