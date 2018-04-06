require 'rails_helper'

RSpec.describe SalesController, type: :controller do

  let(:file) { fixture_file_upload('dados.txt', 'text/txt') }
  let(:invalid_file) { fixture_file_upload('dados_invalidos.txt', 'text/txt') }

  describe 'GET index' do
    it 'must show sales ' do
      sale = FactoryBot.create(:sale)
      get :index
      expect(assigns(:sales)).to include(sale)
    end

    it 'renders the index template' do
      get :index
      assert_template 'sales/index'
    end
  end

  describe 'POST create' do
    context 'valid file' do
      before do
        post :create, params: { file: file }
      end

      it 'should import the sales correctly' do
        expect(flash[:notice]).to be_eql('As vendas foram importadas com sucesso! O total é de: R$ 30,00')
      end

      it 'should increase the count of Sales' do
        expect(Sale.count).to eq 4
      end
    end

    context 'invalid file' do
      before do
        post :create, params: { file: invalid_file }
      end

      it 'should not import the sales correctly' do
        expect(flash[:notice]).to be_eql('As importação de vendas foi mal-sucedida.')
      end

      it 'should not increase the count of Sales' do
        expect(Sale.count).to eq 0
      end
    end
  end
end