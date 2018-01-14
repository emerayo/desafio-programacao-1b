require 'rails_helper'

describe ApplicationHelper, type: :helper do
  describe 'methods' do
    it 'should format float to brazilian currency' do
      response = value_to_money(11.40)
      expect(response).to eq 'R$ 11,40'
    end
  end
end