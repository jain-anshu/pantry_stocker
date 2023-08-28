# frozen_string_literal: true

class AddisAvailableOnInstacartToStores < ActiveRecord::Migration[7.0]
  def change
    add_column :stores, :is_available_on_instacart, :boolean, default: false
  end
end
