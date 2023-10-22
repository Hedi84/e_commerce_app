# frozen_string_literal: true

# cart_items
# item_id     :     integer
# cart_id     :     integer
class CartItem < ApplicationRecord
  validates :cart, presence: true
  validates :item, presence: true

  belongs_to :item
  belongs_to :cart
end
