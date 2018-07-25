class SalesCreateService
  attr_reader :amount, :sales

  def initialize(sales)
    @sales = sales
  end

  def call
    create_sales
  end

  private

  def create_sales
    sales.map! do |row|
      create_sale(row)
    end

    @amount = sales.sum(&:price)
  end

  def create_sale(sale)
    sale = Sale.new(format_sale(sale))
    sale.save
    sale
  end

  def format_sale(row)
    {
      buyer: Buyer.find_or_initialize_by(name: row[:buyer]),
      description: row[:description],
      price: row[:price],
      quantity: row[:quantity],
      provider: Provider.find_or_initialize_by(address: row[:provider_address],
                                               name: row[:provider_name])
    }
  end
end
