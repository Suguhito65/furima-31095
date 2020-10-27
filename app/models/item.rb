class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :burden
  belongs_to_active_hash :area
  belongs_to_active_hash :deliveryday
  has_one :order
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :product
    validates :description
    validates :category
    validates :condition
    validates :burden
    validates :area
    validates :deliveryday
    validates :price,       numericality: { greater_than: 299, less_than: 10000000 , message: " Out of setting range"}
  end

  validates :price, format: { with: /\A[0-9]+\z/, message: "Half-width number" }
  # id:0以外の時に保存できる
  validates :category_id, :condition_id, :burden_id, :area_id, :deliveryday_id, numericality: { other_than: 0 }
end
