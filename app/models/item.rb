class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :burden
  belongs_to_active_hash :area
  belongs_to_active_hash :DeliveryDay
  has_one :order
  belongs_to :user
  has_one_attached :image

  validates :product, :description, :category, :condition, :burden, :area, :delivery_days, :price, presence:true
  # validates :price, format: { with: [3-9][0-9][0-9], message: "Out of setting range" }
  # id:0以外の時に保存できる
  validates :category_id, :condition_id, :burden_id, :area_id, :delivery_days_id, numericality: { other_than: 0 }
end
