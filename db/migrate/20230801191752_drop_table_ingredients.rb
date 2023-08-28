# frozen_string_literal: true

class DropTableIngredients < ActiveRecord::Migration[7.0]
  def up
    drop_table :table_ingredients
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
