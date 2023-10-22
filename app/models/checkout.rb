# frozen_string_literal: true

# checkouts
# card_id     :     integer
# paid        :     boolean
class Checkout < ApplicationRecord
  belongs_to :cart
end
