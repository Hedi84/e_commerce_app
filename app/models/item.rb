# frozen_string_literal: true

# items
# name        :     string
# description :     text
# price       :     integer
class Item < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true
  
  has_many :cart_items, dependent: :destroy
end
