class Purchase
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :token, :user_id

  with_options presence: true do
    validates :postal_code,  format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A[0-9]{,11}\z/, message: "Input only number" }
    validates :token
  end
  # id:0以外の時に保存できる
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    user = User.create(nickname: nickname, email: email, password: password, last_name: last_name, first_name: first_name, last_name_reading: last_name_reading, first_name_reading: first_name_reading, birthday: birthday)
    item = Item.create(product: product, description: description, category_id: category_id, condition_id: condition_id, burden_id: burden_id, area_id: area_id, deliveryday_id: deliveryday_id, price: price, user_id: user.id)
    Order.create(user_id: user.id, item_id: item.id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number)
  end
end