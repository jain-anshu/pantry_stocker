# frozen_string_literal: true

class CreateUnits < ActiveRecord::Migration[7.0]
  def change
    create_table :units do |t|
      t.string :name
      t.integer :equivalent_weight_in_grams
      t.timestamps
    end
  end
end
