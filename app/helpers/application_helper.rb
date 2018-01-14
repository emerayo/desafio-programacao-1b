include ActionView::Helpers::NumberHelper

module ApplicationHelper
  def value_to_money(float)
    number_to_currency(float, unit: 'R$', separator: ',', delimiter: '.')
  end
end
