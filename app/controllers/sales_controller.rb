# frozen_string_literal: true

class SalesController < ApplicationController
  include ApplicationHelper

  def index
    @sales = Sale.all.page(params.fetch(:page, 1)).per(10)
  end

  def create
    response = SalesCreateService.new(file_param[:file].tempfile).call

    if response[:imported].positive?
      redirect_to sales_path, notice: positive_response(response)
    else
      redirect_to sales_path, notice: t('sales_infos.not_imported')
    end
  end

  private

  def file_param
    params.permit(:file)
  end

  def positive_response(response)
    "#{t('sales_infos.imported')} #{t('sales_infos.amount_is')} #{value_to_money(response[:amount])}"
  end
end
