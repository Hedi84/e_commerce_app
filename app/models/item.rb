# frozen_string_literal: true

# items
# name        :     string
# description :     text
# price        :     integer
class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
end
