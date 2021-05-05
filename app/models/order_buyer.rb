class OrderBuyer
  include ActiveModel::Model
  attr_accessor :user_id, :post_code, :city, :address, :building_name, :phone_number, :prefecture_id, :item_id, :order_id, :token
  

  with_options presence: true do
    validates :user_id
    validates :token
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, presence: true, numericality: {other_than: 1, message: "Prefecture Select"}
    validates :city
    validates :address
    validates :phone_number, length:{ maximum: 11}
  end
    validates :phone_number,format: { with:/\A0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1})[-)]?\d{4}\z|\A0[5789]0[-]?\d{4}[-]?\d{4}\z/, message: "Phone number Input only number" }


  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Buyer.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
