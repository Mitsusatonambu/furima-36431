class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :city, :house_number, :user_id, :item_id, :token
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ , message: "is invalid. Include hyphen(-)"}
    validates :phone_number,  format: { with: /\A\d{10,11}\z/ , message: "is invalid"}
  end
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}


  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building: building, phone_number: phone_number, order_id: order.id)
  end


end