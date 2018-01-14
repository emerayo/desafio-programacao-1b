require 'rails_helper'
require 'spec_helper'

describe Sale, type: :model do
  describe 'attributes' do
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:buyer) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:provider) }
    it { should validate_presence_of(:quantity) }
  end
end
