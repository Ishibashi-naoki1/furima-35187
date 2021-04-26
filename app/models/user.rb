class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 
        with_options presence: true do
          validates :nickname, presence:{message: "has already been taken."}
            with_options format:{with: /\A[一-龥ぁ-ん]/, message: "Full-width characters."} do
              validates :first_name
              validates :family_name
            end
            with_options format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/, message: "Include both letters and numbers."} do
              validates :encrypted_password
              validates :password
            end
            with_options format:{with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters."} do
              validates :family_name_kana
              validates :first_name_kana
            end
            with_options format: {with: /\A\d{4}-\d{2}-\d{2}\z/, message: "Birthday can't be blank"} do
              validates :birthday
            end
        end
end
