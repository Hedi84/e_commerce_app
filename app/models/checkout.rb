# frozen_string_literal: true

# checkouts
# cart_id     :     integer
# paid        :     boolean
class Checkout < ApplicationRecord
  validates :cart, presence: true

  belongs_to :cart
end
