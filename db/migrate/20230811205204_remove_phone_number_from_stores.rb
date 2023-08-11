class RemovePhoneNumberFromStores < ActiveRecord::Migration[7.0]
  def change
    remove_column :stores, :phone_number
  end
end
