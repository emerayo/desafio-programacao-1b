require 'rails_helper'

describe Sale, type: :model do
  describe 'attributes' do
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:quantity) }
  end

  describe 'delegations' do
    it { is_expected.to delegate_method(:name).to(:buyer).with_prefix(true) }
    it { is_expected.to delegate_method(:address).to(:provider).with_prefix(true) }
    it { is_expected.to delegate_method(:name).to(:provider).with_prefix(true) }
  end

  describe 'relations' do
    it { should belong_to(:provider) }
    it { should belong_to(:buyer) }
  end
end
