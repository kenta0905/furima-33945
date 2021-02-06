class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # has_many :items
  # has_many :orders
   
  # validates :nickname, presence: true
  # validates :encrypted_password, format: { with: /\A[a-z0-9]+\z/i, message: "半角英数字6文字以上で入力して下さい" }  
  # #validates :encrypted_password,  #2kai
  # validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "全角(漢字・ひらがな・カタカナ)のみで入力して下さい" }  
  # validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "全角(漢字・ひらがな・カタカナ)のみで入力して下さい" }  
  # validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "全角カタカナのみで入力して下さい" } 
  # validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "全角カタカナのみで入力して下さい" } 
  # validates :birth_date, presence: true

  
end


#VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
#validates :password, format: { with: VALID_PASSWORD_REGEX }
#validates :password, format: { with: /\A[a-z0-9]+\z/i }
