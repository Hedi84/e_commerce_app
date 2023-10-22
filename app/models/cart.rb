# frozen_string_literal: true

# carts
# user_id     :     integer
# active      :     boolean
class Cart < ApplicationRecord
  validates :user, presence: true

  belongs_to :user
  has_many :cart_items, dependent: :destroy
  has_one :checkout, dependent: :destroy

  def total
    total_price = 0
    cart_items.each do |cart_item|
      total_price += cart_item.item.price
    end
    total_price
  end
end
