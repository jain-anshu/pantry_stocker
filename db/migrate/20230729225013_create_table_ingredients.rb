# frozen_string_literal: true

class CreateTableIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :table_ingredients do |t|
      t.string :name, null: false
      t.integer :quantity
      t.integer :status
      t.datetime :last_purchased_on
      t.integer :last_purchase_quantity
      t.float :last_purchase_price
      t.timestamps
    end
  end
end
