class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username, null: false, limit: 50
      t.string :password_digest
      t.string :email, null: false
      t.string :phone_number
      t.timestamps
    end
  end
end
