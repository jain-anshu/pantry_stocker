class AddStoresIdToIngredients < ActiveRecord::Migration[7.0]
  def change
    add_column :ingredients, :store_id, :integer
    add_foreign_key :ingredients, :stores
  end
end
