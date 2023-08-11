class RemoveAvailableOnIntacartFromStores < ActiveRecord::Migration[7.0]
  def change
    remove_column :stores, :available_on_instacart
  end
end
