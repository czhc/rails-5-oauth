class AddColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :avatar, :string
    add_column :users, :deleted_at, :datetime
    add_column :users, :admin, :boolean
    add_column :users, :facebook_uid, :string
    add_index :users, :deleted_at
    add_index :users, :api_access_token
  end
end
