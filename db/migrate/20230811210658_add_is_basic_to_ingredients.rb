class AddIsBasicToIngredients < ActiveRecord::Migration[7.0]
  def change
    add_column :ingredients, :is_basic, :boolean, default: false
    add_column :ingredients, :is_family_favorite, :boolean, default: false
    add_column :ingredients, :also_known_as, :string, default: nil
  end
end
