# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CartItem, type: :model do
  let(:user) { User.create(email: 'user@email.com', password: 'password123') }
  let(:cart) { Cart.create(user_id: user.id) }
  let(:name) { 'Desk Chair' }
  let(:description) { 'Comfortable desk chair' }
  let(:price) { 79.99 }
  let(:item) { Item.create(name:, description:, price:) }

  describe 'validations' do
    it 'belongs to cart' do
      expect(subject).to respond_to(:cart)
    end

    it 'belongs to item' do
      expect(subject).to respond_to(:item)
    end

    it 'is valid with all necessary attributes' do
      expect(described_class.create(cart:, item:)).to be_valid
    end

    it 'is not valid with a missing attribute' do
      expect(described_class.create(cart: nil, item:)).not_to be_valid
      expect(described_class.create(cart:, item: nil)).not_to be_valid
    end
  end
end
