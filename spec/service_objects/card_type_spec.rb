require 'rails_helper'
describe CardType do
  subject(:card_type) do
    described_class.new(number).call
  end

  context 'when given a valid VISA card number' do
    let(:number) { '4408041234567893' }
    it 'returns valid as response' do
      expect(card_type).to eq('VISA')
    end
  end

  context 'when given a valid DISCOVER card number' do
    let(:number) { '6011111111111117' }
    it 'returns valid as response' do
      expect(card_type).to eq('Discover')
    end
  end

  context 'when given a valid AMEX card number' do
    let(:number) { '378282246310005' }
    it 'returns valid as response' do
      expect(card_type).to eq('AMEX')
    end
  end

  context 'when given a valid MASTERCARD card number' do
    let(:number) { '5555555555554444' }
    it 'returns valid as response' do
      expect(card_type).to eq('MasterCard')
    end
  end

  context 'when given an invalid card number' do
    let(:number) { '899JK4408041234567893' }
    it 'returns valid as response' do
      expect(card_type).to eq('Unknown')
    end
  end
end
