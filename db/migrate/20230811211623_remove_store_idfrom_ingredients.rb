class RemoveStoreIdfromIngredients < ActiveRecord::Migration[7.0]
  def change
    remove_column :ingredients, :store_id
  end
end
