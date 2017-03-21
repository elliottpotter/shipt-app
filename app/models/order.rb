class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_products
  has_many :products, through: :order_products

  validates :status, inclusion: { in: [ "pending", "en_route", "delivered" ] }
end
