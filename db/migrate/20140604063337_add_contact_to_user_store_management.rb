class AddContactToUserStoreManagement < ActiveRecord::Migration
  def change
    add_column :user_store_managements, :contact, :hstore
    add_column :user_store_managements, :invoice, :hstore
    add_column :user_store_managements, :orders, :hstore
    add_column :user_store_managements, :commission, :hstore
    add_column :user_store_managements, :user_rep, :hstore
  end
end
