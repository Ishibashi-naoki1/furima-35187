class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many  :items
         
         validates :nickname, presence: true, presence:{message: "has already been taken."}
         validates :encrypted_password, :password, format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/, message: "Include both letters and numbers."}
         validates :family_name, presence: true, format:{with: /\A[一-龥ぁ-ん]/, message: "Full-width characters."}
         validates :first_name, presence: true, format:{with: /\A[一-龥ぁ-ん]/, message: "Full-width characters."}
         validates :family_name_kana, presence: true, format:{with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters."}
         validates :first_name_kana, presence: true, format:{with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters."}
         validates :birthday, format:{with: /\A\d{4}-\d{2}-\d{2}\z/, message: "can't be blank"}
end
