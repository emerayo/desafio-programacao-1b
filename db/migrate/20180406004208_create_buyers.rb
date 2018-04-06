class CreateBuyers < ActiveRecord::Migration[5.1]
  def change
    create_table :buyers do |t|
      t.string :name
    end
  end
end
