class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders
         
  with_options presence: true do
    validates :password,           format: { with: /\A[a-zA-Z0-9\d]+\z/, message: "Half-width alphanumeric" }
    validates :last_name,          format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters." }
    validates :first_name,         format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters." }
    validates :last_name_reading,  format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters." }
    validates :first_name_reading, format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters." }
  end
         
  validates :nickname,           presence: true
  validates :password,           presence: true, length: { minimum: 6 } #6文字以上
  validates :last_name,          presence: true
  validates :first_name,         presence: true
  validates :last_name_reading,  presence: true
  validates :first_name_reading, presence: true
  validates :birthday,           presence: true
end
