class CreateSales < ActiveRecord::Migration[5.1]
  def change
    create_table :sales do |t|
      t.string :address
      t.string :buyer
      t.string :description
      t.decimal :price
      t.string :provider
      t.integer :quantity

      t.timestamps
    end
  end
end
