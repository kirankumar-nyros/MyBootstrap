class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :prid
      t.string :title
      t.text :description
      t.decimal :price
      t.integer :quantity
      t.integer :vat
      t.decimal :total

      t.timestamps
    end
  end
end
