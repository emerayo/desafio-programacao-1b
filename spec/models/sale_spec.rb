require 'rails_helper'

describe Sale, type: :model do
  describe 'attributes' do
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:quantity) }
  end

  describe 'relations' do
    it { should belong_to(:provider) }
    it { should belong_to(:buyer) }
  end
end
