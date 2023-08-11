class AddStoresIdKeyToIngredients < ActiveRecord::Migration[7.0]
  def change
    add_column :ingredients, :stores_id, :integer
    add_foreign_key :ingredients, :stores, column: :stores_id
  end
end
