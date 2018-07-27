class SalesFileParser
  attr_reader :file

  def initialize(file)
    @file = file
  end

  def call
    format_sales
  end

  private

  def format_sales
    parsed_rows = FileParser.call(file, false)

    parsed_rows.map do |row|
      formatted_sale = format_sale(row)
      formatted_sale.values.any? { |v| v.blank? } ? nil : formatted_sale
    end
  end

  def format_sale(row)
    {
      buyer: row[0],
      description: row[1],
      price: row[2],
      quantity: row[3],
      provider_address: row[4],
      provider_name: row[5]
    }
  end
end
