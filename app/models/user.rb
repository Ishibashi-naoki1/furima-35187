class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 
        with_options presence: true do
          validates :nickname, presence:{message: "can't be blank"}
            with_options format:{with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: "Full-width characters."} do
              validates :first_name
              validates :family_name
            end
            with_options format:{with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: "Include both letters and numbers."} do
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
