class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items
  has_many :orders
   
validates :password,format:{with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "半角英数字6文字以上で入力して下さい" }

with_options presence: true do
  validates :nickname  
  validates :birth_date 
end

with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: "全角(漢字・ひらがな・カタカナ)のみで入力して下さい" } do
  validates :last_name
  validates :first_name
end

with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "全角カタカナのみで入力して下さい" } do
 validates :last_name_kana
 validates :first_name_kana
end 

end 
