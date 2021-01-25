class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :nickname, presence: true
         validates :first_name, presence: true
         validates :second_name, presence: true
         validates :first_katakana, presence: true
         validates :second_katakana, presence: true
         validates :birthday, presence: true

        has_many :items
        has_many :buyer_management
end
