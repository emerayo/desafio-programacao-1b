class CreateSales < ActiveRecord::Migration[5.1]
  def change
    create_table :sales do |t|
      t.string :description
      t.decimal :price
      t.integer :quantity
      t.references :buyer
      t.references :provider

      t.timestamps
    end
  end
end
