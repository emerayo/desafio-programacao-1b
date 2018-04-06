require 'rails_helper'

describe SalesCreateService, type: :class do
  let(:file) { File.join(Rails.root, '/spec/fixtures/dados.txt') }

  describe 'call method' do
    it 'must add 4 sales to database' do
      SalesCreateService.new(file).call

      expect(Sale.count).to eq 4
    end

    it 'must return hash in response' do
      response = SalesCreateService.new(file).call

      expect(response[:amount]).to eq 30.0
      expect(response[:imported]).to eq 4
      expect(response[:invalid]).to eq 0
    end
  end
end