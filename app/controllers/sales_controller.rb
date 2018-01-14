include ApplicationHelper

class SalesController < ApplicationController
  def index
    @sales = Sale.all.page(params.fetch(:page, 1)).per(10)
  end

  def new; end

  def create
    response = Sales::Create.call(file_param[:file].tempfile).response

    if response[:imported].positive?
      redirect_to sales_path, notice: positive_response(response)
    else
      redirect_to sales_path, notice: t('sales.not_imported')
    end
  end

  private

  def file_param
    params.permit(:file)
  end

  def positive_response(response)
    t('sales.imported') + ' O total é de: ' + value_to_money(response[:amount])
  end
end
