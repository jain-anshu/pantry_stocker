class AddPhoneNumberToStores < ActiveRecord::Migration[7.0]
  def change
    add_column :stores, :phone_number, :integer
    add_column :stores, :available_on_instacart, :boolean, default: false
    add_column :stores, :has_online_shopping_website, :boolean, default: false
    add_column :stores, :website_url, :string, default: nil
  end
end
