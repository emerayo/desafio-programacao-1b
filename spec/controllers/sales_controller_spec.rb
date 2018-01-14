require 'rails_helper'

RSpec.describe SalesController, type: :controller do
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
    it 'should import the sales correctly' do
      file = fixture_file_upload('dados.txt', 'text/txt')

      post :create, params: { file: file }

      expect(flash[:notice]).to be_eql('As vendas foram importadas com sucesso! O total é de: R$ 30,00')
    end

    it 'should increase the count of Sales' do
      file = fixture_file_upload('dados.txt', 'text/txt')

      post :create, params: { file: file }

      expect(Sale.count).to eq 4
    end

    it 'should import the sales correctly' do
      file = fixture_file_upload('dados_invalidos.txt', 'text/txt')

      post :create, params: { file: file }

      expect(flash[:notice]).to be_eql('As importação de vendas foi mal-sucedida.')
    end

    it 'should not increase the count of Sales when file is empty' do
      file = fixture_file_upload('dados_invalidos.txt', 'text/txt')

      post :create, params: { file: file }

      expect(Sale.count).to eq 0
    end
  end
end