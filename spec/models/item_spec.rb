# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'validations' do
    let(:name) { 'Desk Chair' }
    let(:description) { 'Comfortable desk chair' }
    let(:price) { 79.99 }

    it 'has many cart_items' do
      expect(subject).to respond_to(:cart_items)
    end

    it 'is valid with all necessary attributes' do
      expect(described_class.create(name:, description:, price:)).to be_valid
    end

    it 'is not valid with a missing attributes' do
      expect(described_class.create(name: nil, description:, price:)).not_to be_valid
      expect(described_class.create(name:, description: nil, price:)).not_to be_valid
      expect(described_class.create(name:, description:, price: nil)).not_to be_valid
    end

    it 'is not valid with a name that is not unique' do
      expect(described_class.create(name:, description:, price:)).to be_valid
      expect(described_class.create(name:, description:, price:)).not_to be_valid
    end
  end
end
