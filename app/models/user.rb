class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items
  has_many :orders
   
  validates :nickname, presence: true
  validates :encrypted_password, format: { with: /\A[a-z0-9]+\z/i }           #半角英数字必須
  #validates :encrypted_password,  #2kai
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }  #kanhirakana?  /\A[ぁ-んァ-ン一-龥]/
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }  #kanhirakana? /\A[ぁ-んァ-ン一-龥]/
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }  #kana? /\A[ァ-ヶー－]+\z/
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }  #kana? /\A[ァ-ヶー－]+\z/
  validates :birth_date, presence: true

  
end


#VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
#validates :password, format: { with: VALID_PASSWORD_REGEX }
#validates :password, format: { with: /\A[a-z0-9]+\z/i }
