# frozen_string_literal: true

require 'rails_helper'

describe SalesCreatorService, type: :class do
  let(:sale1) { { buyer: 'Billy The Kid', description: 'R$10 off R$20 of food',
                  price: '10.0', quantity: '2', provider_address: '987 Fake St',
                  provider_name: "Bob's Pizza" } }

  let(:sale2) { { buyer: 'Amy Pond', description: 'R$30 of awesome for R$10',
                  price: '10.0', quantity: '5', provider_address: '456 Unreal Rd',
                  provider_name: "Tom's Awesome Shop" } }

  describe 'call method' do
    context 'when receiving a single sale' do
      it 'must add a sale to database' do
        SalesCreatorService.new([sale1]).call

        expect(Sale.count).to eq 1
      end
    end

    context 'when receiving two sales' do
      it 'must be able to access amount and sales attributes' do
        response = SalesCreatorService.new([sale1, sale2])
        response.call

        expect(Sale.count).to eq 2
        expect(response.amount).to eq 20.0
        expect(response.sales.size).to eq 2
      end
    end

    context 'when receiving an empty array' do
      it 'must not create any sale' do
        response = SalesCreatorService.new([])
        response.call

        expect(Sale.count).to eq 0
        expect(response.amount).to eq 0.0
        expect(response.sales.size).to eq 0
      end
    end
  end
end
