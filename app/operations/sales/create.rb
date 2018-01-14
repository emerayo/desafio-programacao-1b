module Sales
  class Create
    attr_reader :file, :response

    def self.call(file)
      this = new(file)
      this.call
      this
    end

    def initialize(file)
      @file = file
    end

    def call
      create_sales
    end

    private

    def create_sales
      parsed_rows = FileParserService.call(file, false)
      sales = []

      parsed_rows.each do |row|
        sale = Sale.create(format_sale(row))
        sales << sale if sale.valid?
      end

      amount = sales.sum(&:price)

      format_response(amount, sales.size, parsed_rows.size)
    end

    def format_response(amount, valid_sales, file_sales)
      @response = { amount: amount,
                    imported: valid_sales,
                    invalid: file_sales - valid_sales }
    end

    def format_sale(row)
      {
        buyer: row[0],
        description: row[1],
        price: row[2],
        quantity: row[3],
        address: row[4],
        provider: row[5]
      }
    end
  end
end