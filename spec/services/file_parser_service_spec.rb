require 'rails_helper'

describe FileParserService, type: :class do
  describe 'call method' do
    it 'must return 4 rows without the header' do
      file = File.join(Rails.root, '/spec/fixtures/dados.txt')
      parsed_rows = FileParserService.call(file, false)

      expect(parsed_rows.size).to eq 4
    end

    it 'must return 5 rows including the header' do
      file = File.join(Rails.root, '/spec/fixtures/dados.txt')
      parsed_rows = FileParserService.call(file, true)

      expect(parsed_rows).not_to be_empty
      expect(parsed_rows.size).to eq 5
    end

    it 'must return an array' do
      file = File.join(Rails.root, '/spec/fixtures/dados.txt')
      parsed_rows = FileParserService.call(file, true)

      expect(parsed_rows).to be_instance_of(Array)
    end
  end
end