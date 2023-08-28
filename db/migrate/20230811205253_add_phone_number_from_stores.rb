# frozen_string_literal: true

class AddPhoneNumberFromStores < ActiveRecord::Migration[7.0]
  def change
    add_column :stores, :phone_number, :bigint
  end
end
