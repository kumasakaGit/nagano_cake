class Item < ApplicationRecord
  has_many :cart_items

  validates :price, presence: true

  def with_tax_price
    (price * 1.1).floor
  end
end
