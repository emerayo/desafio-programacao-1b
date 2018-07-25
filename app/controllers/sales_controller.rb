# frozen_string_literal: true

class SalesController < ApplicationController
  include ApplicationHelper

  def index
    @sales = Sale.all.page(params.fetch(:page, 1)).per(10)
  end

  def create
    sales = parse_and_create_sales

    if sales.amount.positive?
      redirect_to sales_path, notice: positive_response(sales)
    else
      redirect_to sales_path, alert: t('sales_infos.not_imported')
    end
  end

  private

  def file_param
    params.permit(:file)
  end

  def parse_and_create_sales
    parsed_sales = SalesFileParserService.new(file_param[:file].tempfile).call
    sales_service = SalesCreateService.new(parsed_sales.compact)
    sales_service.call
    sales_service
  end

  def positive_response(response)
    "#{t('sales_infos.imported')} #{t('sales_infos.amount_is')} #{value_to_money(response.amount)}"
  end
end
