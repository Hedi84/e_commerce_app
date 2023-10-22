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
end
