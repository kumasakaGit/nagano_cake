class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :image
  has_many :cart_items
  has_many :orders

  def active_for_authentication?
    super && (is_deleted == "active")
  end

  enum is_deleted: { active: false, unsubscribe: true }
end
