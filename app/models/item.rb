class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :area
  belongs_to :delivery_day
  has_one_attached :image
  has_one :order

  validates    :title, :description, :category_id, :status_id, :delivery_charge_id, :area_id, :delivery_day_id, :price, :image,     presence: true
  validates    :category_id, :status_id, :delivery_charge_id, :area_id, :delivery_day_id,     numericality: { other_than: 1 }
  validates_inclusion_of :price, in: 300..9_999_999
  validates    :price,      numericality: { only_integer: true }
end
