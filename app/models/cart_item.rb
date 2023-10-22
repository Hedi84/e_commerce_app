# frozen_string_literal: true

# cart_items
# item_id     :     integer
# cart_id     :     integer
class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :cart
end
