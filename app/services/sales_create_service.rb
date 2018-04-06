class SalesCreateService
  attr_reader :file, :response

  def initialize(file)
    @file = file
  end

  def call
    create_sales
    @response
  end

  private

  def create_sales
    parsed_rows = FileParserService.call(file, false)

    sales = parsed_rows.map do |row|
      initialize_sale(row)
    end

    amount = sales.sum(&:price)

    format_response(amount, sales.size, parsed_rows.size)
  end

  def format_response(amount, valid_sales, file_sales)
    @response = { amount: amount,
                  imported: valid_sales,
                  invalid: file_sales - valid_sales }
  end

  def initialize_sale(row)
    return if row.compact.size != 6

    sale = Sale.new(format_sale(row))

    return unless sale.valid?

    sale.save
    sale
  end

  def format_sale(row)
    {
      buyer: Buyer.find_or_create_by(name: row[0]),
      description: row[1],
      price: row[2],
      quantity: row[3],
      provider: Provider.find_or_create_by(address: row[4], name: row[5])
    }
  end
end
