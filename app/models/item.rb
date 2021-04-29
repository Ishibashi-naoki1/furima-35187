class Item < ApplicationRecord
  belongs_to :user
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :carriage
  belongs_to :brand
  belongs_to :ship_date
  has_one_attached :image
  
  validates :price, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }

  with_options presence: true do
   validates :item_name, length: { maximum: 40 }
   validates :condition, length: { maximum: 1000 }
  end

  with_options presence: true, numericality: { other_than: 1, message: 'cna’t be blank'} do
    validates :category_id
    validates :prefecture_id
    validates :carriage_id
    validates :brand_id
    validates :ship_date_id
  end
  
end