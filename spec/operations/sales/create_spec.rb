require 'rails_helper'

describe Sales::Create, type: :class do
  describe 'call method' do
    it 'must add 4 sales to database' do
      file = File.join(Rails.root, '/spec/fixtures/dados.txt')
      Sales::Create.call(file)

      expect(Sale.count).to eq 4
    end

    it 'must return hash in response' do
      file = File.join(Rails.root, '/spec/fixtures/dados.txt')
      response = Sales::Create.call(file).response

      expect(response[:amount]).to eq 30.0
      expect(response[:imported]).to eq 4
      expect(response[:invalid]).to eq 0
    end
  end
end