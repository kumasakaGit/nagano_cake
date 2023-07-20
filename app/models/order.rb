class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items

  has_one_attached :image
  enum payment_methods: { credit_card: 1, transfer: 2 }
end
