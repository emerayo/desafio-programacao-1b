# frozen_string_literal: true

require 'rails_helper'

describe FileParserService, type: :class do
  let(:file) { File.join(Rails.root, '/spec/fixtures/dados.txt') }

  describe 'call method' do
    context 'without header' do
      let(:parsed_rows) { FileParserService.call(file) }

      it 'must return 4 rows without the header' do
        expect(parsed_rows.size).to eq 4
      end

      it 'must return an array' do
        expect(parsed_rows).to be_instance_of(Array)
      end
    end

    context 'with header' do
      let(:parsed_rows) { FileParserService.call(file, true) }

      it 'must return 5 rows including the header' do
        expect(parsed_rows).not_to be_empty
        expect(parsed_rows.size).to eq 5
      end

      it 'must return an array' do
        expect(parsed_rows).to be_instance_of(Array)
      end
    end
  end
end
