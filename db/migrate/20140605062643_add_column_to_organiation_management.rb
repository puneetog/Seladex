class AddColumnToOrganiationManagement < ActiveRecord::Migration
  def change
  	add_column :organization_managements, :contact, :hstore
    add_column :organization_managements, :invoice, :hstore
    add_column :organization_managements, :orders, :hstore
    add_column :organization_managements, :commission, :hstore
    add_column :organization_managements, :user_rep, :hstore
  end
end
