class CreateProdacts < ActiveRecord::Migration[5.1]
  def change
    create_table :prodacts do |t|
      t.string :name
      t.text :decription
      t.decimal :price, precision: 8, scale: 2
      t.integer :quantity
      t.boolean :is_active, default: true
      t.timestamps
    end
  end
end
