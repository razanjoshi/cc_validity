require 'rails_helper'
describe CardValidation do
  subject(:card_validation) do
    described_class.new(number).call
  end

  context 'when given a valid card number' do
    let(:number) { '4408041234567893' }
    it 'returns valid as response' do
      expect(card_validation).to eq('valid')
    end
  end

  context 'when given an invalid card number' do
    let(:number) { '899JK4408041234567893' }
    it 'returns valid as response' do
      expect(card_validation).to eq('invalid')
    end
  end
end
