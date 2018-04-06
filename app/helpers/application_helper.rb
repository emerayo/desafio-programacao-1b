# frozen_string_literal: true

module ApplicationHelper
  include ActionView::Helpers::NumberHelper

  def value_to_money(float)
    number_to_currency(float, unit: 'R$', separator: ',', delimiter: '.')
  end
end
