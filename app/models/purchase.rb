class Purchase
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number

  with_options presence: true do
    validates :postal_code,format: {with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters."}
    validates :prefecture
    validates :city
    validates :house_number
    validates :phone_number
  end
  # id:0以外の時に保存できる
  validates :prefecture, numericality: { other_than: 0, message: "can't be blank" }

  def save
    Order.create(user_id: user.id, item_id: item.id)
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end