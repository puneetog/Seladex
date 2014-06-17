class AddPermissionFieldsToRole < ActiveRecord::Migration
  def change
    add_column :roles, :contact, :hstore
    add_column :roles, :orders, :hstore
    add_column :roles, :commission, :hstore
    add_column :roles, :invoice, :hstore
    add_column :roles, :user_rep, :hstore
  end
end
