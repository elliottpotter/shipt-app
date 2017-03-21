class AddApiKeyToCustomers < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :api_key, :string
  end
end
