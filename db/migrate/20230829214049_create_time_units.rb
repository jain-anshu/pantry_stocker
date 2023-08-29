class CreateTimeUnits < ActiveRecord::Migration[7.0]
  def change
    create_table :time_units do |t|
      t.string :time_unit_name
      t.float :days_per_unit
      t.timestamps
    end
  end
end
