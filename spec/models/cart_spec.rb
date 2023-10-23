# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe 'validations' do
    let(:user) { User.create(email: 'user@email.com', password: 'password123') }

    it 'belongs to checkout' do
      expect(subject).to respond_to(:checkout)
    end

    it 'has many cart items' do
      expect(subject).to respond_to(:cart_items)
    end

    it 'is valid with all necessary attributes' do
      expect(described_class.create(user_id: user.id)).to be_valid
    end

    it 'is not valid with a missing attribute' do
      expect(described_class.create(user_id: nil)).not_to be_valid
    end
  end

  describe '#total' do
    let(:user) { User.create(email: 'user@email.com', password: 'password123') }
    let(:cart) { described_class.create(user_id: user.id) }
    let(:item) { Item.create(name: 'A new item', description: 'amazing!', price: 50) }
    let(:cart_item_one) { CartItem.create(cart:, item:) }
    let(:cart_item_two) { CartItem.create(cart:, item:) }

    it 'calculates the total of a cart' do
      cart_item_one
      cart_item_two
      expect(cart.total.to_i).to eq(100)
      CartItem.create(cart:, item:)
      cart.reload
      expect(cart.total.to_i).to eq(150)
    end
  end
end
