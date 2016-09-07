class AddApiKeyToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :api_access_token, :string
  end
end
