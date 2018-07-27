# frozen_string_literal: true

require 'rails_helper'

describe SalesFileParser, type: :class do
  let(:file) { File.join(Rails.root, '/spec/fixtures/data.txt') }
  let(:file_with_invalid_rows) { File.join(Rails.root, '/spec/fixtures/data_with_invalid_rows.txt') }
  let(:empty_file) { File.join(Rails.root, '/spec/fixtures/empty_data.txt') }
  let(:sale1) { { buyer: 'João Silva', description: 'R$10 off R$20 of food',
                  price: '10.0', quantity: '2', provider_address: '987 Fake St',
                  provider_name: "Bob's Pizza" } }

  describe 'call method' do
    context 'file with valid rows' do
      subject { SalesFileParser.new(file).call }

      it 'must return an array' do
        expect(subject.is_a? Array).to be_truthy
      end

      it 'must return an array of hash' do
        expect(subject.first).to eq sale1
      end

      it 'must return an array with 4 sales' do
        expect(subject.size).to eq 4
      end
    end

    context 'file with invalid rows' do
      subject { SalesFileParser.new(empty_file).call }

      it 'must return an array' do
        expect(subject.is_a? Array).to be_truthy
      end

      it 'must return an empty array' do
        expect(subject.size).to eq 0
      end
    end

    context 'file without any rows' do
      subject { SalesFileParser.new(file_with_invalid_rows).call }

      it 'must return an array' do
        expect(subject.is_a? Array).to be_truthy
      end

      it 'must return an array of hash' do
        expect(subject.first).to eq sale1
      end

      it 'must return a nil value for invalid row' do
        expect(subject.second).to be_nil
      end

      it 'must return an empty array' do
        expect(subject.size).to eq 4
      end
    end
  end
end
