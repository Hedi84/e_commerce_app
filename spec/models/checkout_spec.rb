# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Checkout, type: :model do
  describe 'validations' do
    let(:user) { User.create(email: 'user@email.com', password: 'password123') }
    let(:cart) { Cart.create(user_id: user.id) }

    it 'belongs to cart' do
      expect(subject).to respond_to(:cart)
    end

    it 'is valid with all necessary attributes' do
      expect(described_class.create(cart_id: cart.id)).to be_valid
    end

    it 'is not valid with a missing attribute' do
      expect(described_class.create(cart_id: nil)).not_to be_valid
    end
  end
end
