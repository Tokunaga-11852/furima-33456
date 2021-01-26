class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: "is invalid. Input full-width characters." }
    validates :second_name, format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: "is invalid. Input full-width characters." }
    validates :first_katakana, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters." }
    validates :second_katakana, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters." }
    validates :birthday
    validates :password, format: (/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i)

  end
    has_many :items
    has_many :buyer_managements
end
