class CreateIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredients do |t|
      t.string :name, null: false
      t.references :categories, foreign_key: true
      t.integer :quantity
      t.references :units, foreign_key: true
      t.integer :status
      t.datetime :last_purchased_on
      t.float :last_purchase_quantity
      t.float :last_purchase_price
      t.timestamps
     
    end
  end
end
