class Order < ApplicationRecord
  has_one_attached :image
  enum payment_method: { credit_card: 1, transfer: 2 }
end
