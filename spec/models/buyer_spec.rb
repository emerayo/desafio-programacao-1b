require 'rails_helper'

describe Buyer, type: :model do
  describe 'attributes' do
    it { should validate_presence_of(:name) }
  end

  describe 'relations' do
    it { should have_many(:sale) }
  end
end
