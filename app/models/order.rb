class Order < ApplicationRecord
  enum payment_method: { credit_card: 1, transfer: 2 }
end
