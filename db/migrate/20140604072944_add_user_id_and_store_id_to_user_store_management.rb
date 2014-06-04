class AddUserIdAndStoreIdToUserStoreManagement < ActiveRecord::Migration
  def change
    add_column :user_store_managements, :store_id, :integer
    add_column :user_store_managements, :user_id, :integer
  end
end
