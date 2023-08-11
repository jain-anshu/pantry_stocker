class AddDistanceFromMeToStores < ActiveRecord::Migration[7.0]
  def change
    add_column :stores, :distance_from_me, :integer
  end
end
